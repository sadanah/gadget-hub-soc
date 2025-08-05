using BCrypt.Net;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Runtime.Serialization;
using System.Text;

namespace GadgetHub.Service
{
    [DataContract]
    public class UserDTO
    {
        [DataMember]
        public int Id { get; set; }

        [DataMember]
        public string Role { get; set; }
    }

    [DataContract]
    public class Category
    {
        [DataMember]
        public int Id { get; set; }

        [DataMember]
        public string Name { get; set; }
    }

    [DataContract]
    public class ProductDTO
    {
        [DataMember]
        public int Id { get; set; }

        [DataMember]
        public string Name { get; set; }

        [DataMember]
        public int Price { get; set; }

        [DataMember]
        public string Image { get; set; }

        [DataMember]
        public int CategoryId { get; set; }
    }

    [DataContract]
    public class CartItemDTO
    {
        [DataMember]
        public int ProductId { get; set; }

        [DataMember]
        public string ProductName { get; set; }

        [DataMember]
        public string Image { get; set; }

        [DataMember]
        public int Price { get; set; }

        [DataMember]
        public int Qty { get; set; }
    }


    public class GadgetHubService : IGadgetHubService
    {
        private readonly string connectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=D:\\SOC\\GadgetHub\\GadgetHubDB.mdf;Integrated Security=True;Connect Timeout=30;Encrypt=False";
        public bool RegisterUser(string firstName, string lastName, string phoneNumber, string username, string password, string email, string role)
        {
            // Hash the password using bcrypt
            string hashedPassword = BCrypt.Net.BCrypt.HashPassword(password);

            //string connectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=D:\\SOC\\GadgetHub\\GadgetHubDB.mdf;Integrated Security=True;Connect Timeout=30;Encrypt=False";
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "INSERT INTO Users (FirstName, LastName, PhoneNumber, Username, Password, Email, Role) VALUES (@FirstName, @LastName, @PhoneNumber, @Username, @Password, @Email, @Role)";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@FirstName", firstName);
                cmd.Parameters.AddWithValue("@LastName", lastName);
                cmd.Parameters.AddWithValue("@PhoneNumber", phoneNumber);
                cmd.Parameters.AddWithValue("@Username", username);
                cmd.Parameters.AddWithValue("@Password", hashedPassword); // Store hashed password
                cmd.Parameters.AddWithValue("@Email", email);
                cmd.Parameters.AddWithValue("@Role", role);

                conn.Open();
                int rowsAffected = cmd.ExecuteNonQuery();
                return rowsAffected > 0;
            }
        }

        public UserDTO Login(string email, string password)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "SELECT Id, Password, Role FROM Users WHERE Email = @Email";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Email", email);

                conn.Open();
                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    if (reader.Read())
                    {
                        int userId = reader.GetInt32(0);
                        string hashedPassword = reader.GetString(1);
                        string role = reader.GetString(2);

                        if (BCrypt.Net.BCrypt.Verify(password, hashedPassword))
                        {
                            return new UserDTO { Id = userId, Role = role };
                        }
                    }
                }
            }
            return null;
        }

        public List<Category> GetCategories()
        {
            List<Category> categories = new List<Category>();
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "SELECT Id, Name FROM Category";
                SqlCommand cmd = new SqlCommand(query, conn);
                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    categories.Add(new Category
                    {
                        Id = Convert.ToInt32(reader["Id"]),
                        Name = reader["Name"].ToString()
                    });
                }
            }
            return categories;
        }

        public List<ProductDTO> GetProducts(string searchTerm, int[] categoryIds)
        {
            List<ProductDTO> products = new List<ProductDTO>();

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                StringBuilder queryBuilder = new StringBuilder("SELECT Id, Name, Price, Image, CategoryId FROM Product WHERE IsActive = 1");

                if (!string.IsNullOrEmpty(searchTerm))
                {
                    queryBuilder.Append(" AND Name LIKE @SearchTerm");
                }

                if (categoryIds != null && categoryIds.Length > 0)
                {
                    string ids = string.Join(",", categoryIds);
                    queryBuilder.Append($" AND CategoryId IN ({ids})");
                }

                SqlCommand cmd = new SqlCommand(queryBuilder.ToString(), conn);

                if (!string.IsNullOrEmpty(searchTerm))
                {
                    cmd.Parameters.AddWithValue("@SearchTerm", "%" + searchTerm + "%");
                }

                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    products.Add(new ProductDTO
                    {
                        Id = Convert.ToInt32(reader["Id"]),
                        Name = reader["Name"].ToString(),
                        Price = Convert.ToInt32(reader["Price"]),
                        Image = reader["Image"].ToString(),
                        CategoryId = Convert.ToInt32(reader["CategoryId"])
                    });
                }
            }

            return products;
        }

        public void AddToCart(int userId, int productId, int qty)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "IF EXISTS (SELECT 1 FROM Cart WHERE UserId = @UserId AND ProductId = @ProductId) " +
                               "UPDATE Cart SET Qty = Qty + @Qty WHERE UserId = @UserId AND ProductId = @ProductId " +
                               "ELSE INSERT INTO Cart (UserId, ProductId, Qty) VALUES (@UserId, @ProductId, @Qty)";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@UserId", userId);
                cmd.Parameters.AddWithValue("@ProductId", productId);
                cmd.Parameters.AddWithValue("@Qty", qty);

                conn.Open();
                cmd.ExecuteNonQuery();
            }
        }

        public int GetCartItemCount(int userId)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "SELECT ISNULL(SUM(Qty), 0) FROM Cart WHERE UserId = @UserId";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@UserId", userId);

                conn.Open();
                return Convert.ToInt32(cmd.ExecuteScalar());
            }
        }

        public List<CartItemDTO> GetCartItems(int userId)
        {
            List<CartItemDTO> cartItems = new List<CartItemDTO>();

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = @"SELECT c.ProductId, p.Name AS ProductName, p.Image, p.Price, c.Qty
                         FROM Cart c
                         JOIN Product p ON c.ProductId = p.Id
                         WHERE c.UserId = @UserId";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@UserId", userId);

                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    cartItems.Add(new CartItemDTO
                    {
                        ProductId = Convert.ToInt32(reader["ProductId"]),
                        ProductName = reader["ProductName"].ToString(),
                        Image = reader["Image"].ToString(),
                        Price = Convert.ToInt32(reader["Price"]),
                        Qty = Convert.ToInt32(reader["Qty"])
                    });
                }
            }

            return cartItems;
        }

        public void UpdateCartItemQty(int userId, int productId, int qtyChange)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = @"UPDATE Cart SET Qty = Qty + @QtyChange WHERE UserId = @UserId AND ProductId = @ProductId;
                         DELETE FROM Cart WHERE UserId = @UserId AND ProductId = @ProductId AND Qty <= 0;";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@UserId", userId);
                cmd.Parameters.AddWithValue("@ProductId", productId);
                cmd.Parameters.AddWithValue("@QtyChange", qtyChange);

                conn.Open();
                cmd.ExecuteNonQuery();
            }
        }

        public void RemoveCartItem(int userId, int productId)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "DELETE FROM Cart WHERE UserId = @UserId AND ProductId = @ProductId";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@UserId", userId);
                cmd.Parameters.AddWithValue("@ProductId", productId);

                conn.Open();
                cmd.ExecuteNonQuery();
            }
        }

        public bool PlaceOrder(int userId, string deliveryAddress)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                SqlTransaction transaction = conn.BeginTransaction();

                try
                {
                    // 1. Calculate total from cart
                    string totalQuery = "SELECT SUM(p.Price * c.Qty) FROM Cart c JOIN Product p ON c.ProductId = p.Id WHERE c.UserId = @UserId";
                    SqlCommand totalCmd = new SqlCommand(totalQuery, conn, transaction);
                    totalCmd.Parameters.AddWithValue("@UserId", userId);

                    int total = Convert.ToInt32(totalCmd.ExecuteScalar());

                    // 2. Insert Order
                    string insertOrderQuery = "INSERT INTO [Order] (UserId, Total, DeliveryAddress, Status, CreatedAt) VALUES (@UserId, @Total, @DeliveryAddress, 'Pending', GETDATE()); SELECT SCOPE_IDENTITY();";
                    SqlCommand orderCmd = new SqlCommand(insertOrderQuery, conn, transaction);
                    orderCmd.Parameters.AddWithValue("@UserId", userId);
                    orderCmd.Parameters.AddWithValue("@Total", total);
                    orderCmd.Parameters.AddWithValue("@DeliveryAddress", deliveryAddress);

                    int orderId = Convert.ToInt32(orderCmd.ExecuteScalar());

                    // 3. Insert Order_Items
                    string getCartItemsQuery = "SELECT ProductId, Qty FROM Cart WHERE UserId = @UserId";
                    SqlCommand cartCmd = new SqlCommand(getCartItemsQuery, conn, transaction);
                    cartCmd.Parameters.AddWithValue("@UserId", userId);

                    SqlDataReader reader = cartCmd.ExecuteReader();
                    List<Tuple<int, int>> cartItems = new List<Tuple<int, int>>();
                    while (reader.Read())
                    {
                        cartItems.Add(new Tuple<int, int>(
                            Convert.ToInt32(reader["ProductId"]),
                            Convert.ToInt32(reader["Qty"])));
                    }
                    reader.Close();

                    foreach (var item in cartItems)
                    {
                        string insertOrderItemQuery = "INSERT INTO Order_Items (OrderId, ProductId, Qty) VALUES (@OrderId, @ProductId, @Qty)";
                        SqlCommand orderItemCmd = new SqlCommand(insertOrderItemQuery, conn, transaction);
                        orderItemCmd.Parameters.AddWithValue("@OrderId", orderId);
                        orderItemCmd.Parameters.AddWithValue("@ProductId", item.Item1);
                        orderItemCmd.Parameters.AddWithValue("@Qty", item.Item2);

                        orderItemCmd.ExecuteNonQuery();
                    }

                    // 4. Clear Cart
                    string clearCartQuery = "DELETE FROM Cart WHERE UserId = @UserId";
                    SqlCommand clearCartCmd = new SqlCommand(clearCartQuery, conn, transaction);
                    clearCartCmd.Parameters.AddWithValue("@UserId", userId);
                    clearCartCmd.ExecuteNonQuery();

                    transaction.Commit();
                    return true;
                }
                catch
                {
                    transaction.Rollback();
                    return false;
                }
            }
        }

    }
}