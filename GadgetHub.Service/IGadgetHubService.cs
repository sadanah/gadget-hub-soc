using System.Collections.Generic;
using System.ServiceModel;

namespace GadgetHub.Service
{
    // This interface defines the contract for the GadgetHub service, which includes methods for user registration.
    // The methods are decorated with OperationContract to indicate that they can be called by clients.
    [ServiceContract]
    public interface IGadgetHubService
    {
        [OperationContract]
        bool RegisterUser(string firstName, string lastName, string phoneNumber, string username, string password, string email, string role);

        [OperationContract]
        UserDTO Login(string email, string password);

        [OperationContract]
        List<Category> GetCategories();

        [OperationContract]
        List<ProductDTO> GetProducts(string searchTerm, int[] categoryIds);

        [OperationContract]
        void AddToCart(int userId, int productId, int qty);

        [OperationContract]
        int GetCartItemCount(int userId);

        [OperationContract]
        List<CartItemDTO> GetCartItems(int userId);

        [OperationContract]
        void UpdateCartItemQty(int userId, int productId, int qtyChange);

        [OperationContract]
        void RemoveCartItem(int userId, int productId);

    }
}

