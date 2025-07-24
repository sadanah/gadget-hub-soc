# Gadget Hub Web Application

This is the Gadget Hub project — an ASP.NET web application integrated with a SOAP web service and a SQL Server database. It allows Gadget Hub, distributors, and customers to interact with inventory and pricing.

---

## Project Structure

- **GadgetHubWeb** — ASP.NET Web Forms project (frontend)
- **GadgetHubService** — ASP.NET Web Service (SOAP) for business logic and database access
- **GadgetHubDB.mdf** — LocalDB database file (not included in repo)
- Other projects (Console app, Windows Forms app) to be added later

---

## Prerequisites

- Visual Studio 2019 or later with ASP.NET and web development workloads installed
- .NET Framework 4.7.2 or later
- SQL Server Express LocalDB (usually installed with Visual Studio)
- Internet connection to restore NuGet packages

---

## Setup Instructions

### 1. Clone the Repository

```bash
git clone https://github.com/yourusername/GadgetHub.git
cd GadgetHub
```

### 2. Restore NuGet Packages

Open the solution in Visual Studio and restore any missing NuGet packages via:

- Right-click the solution in Solution Explorer → Restore NuGet Packages

### 3. Setup the Database

- Open **SQL Server Management Studio (SSMS)** or use Visual Studio's SQL Server Object Explorer.
- Connect to your local `(LocalDB)\MSSQLLocalDB` instance.
- Create a new database named `GadgetHubDB` (or your preferred name).
- Run the SQL script `CreateDatabaseSqlQuery.sql` (provided in the repo) to create tables and insert seed data:

```sql
-- CreateDatabaseSqlQuery.sql content example
CREATE TABLE Login (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Username NVARCHAR(100) NOT NULL,
    Password NVARCHAR(255) NOT NULL,  -- store hashed passwords ideally
    Email NVARCHAR(255) NOT NULL UNIQUE
);

INSERT INTO Login (Username, Password, Email)
VALUES ('testuser', 'testpassword', 'testuser@example.com');
```

> **Note:** The `.mdf` database file is **not included** in the repo. You need to create the DB manually with the script.

### 4. Configure Connection String

- In the `GadgetHubService` project, open `Web.config`.
- Update the connection string to point to your local database instance and DB name:

```xml
<connectionStrings>
  <add name="GadgetHubDB" connectionString="Data Source=(LocalDB)\MSSQLLocalDB;Initial Catalog=GadgetHubDB;Integrated Security=True;" providerName="System.Data.SqlClient" />
</connectionStrings>
```

### 5. Run the Projects

- Set `GadgetHubWeb` as the startup project.
- Start debugging (F5) in Visual Studio. This will launch the web app.
- The web app calls the web service (`GadgetHubService`) internally to perform login and other operations.

---

## Notes

- Passwords are currently stored in plain text for simplicity. For production, implement hashing & salting.
- The Windows Forms and Console apps are planned for future development.
- Make sure ports used by the web service and web app do not conflict.
- You can add more seed data or tables by modifying the SQL script.

---

## Troubleshooting

- **Service endpoint not found:** Make sure `GadgetHubService` is running and accessible. Check the service URL in your web.config or app.config.
- **Database connection errors:** Verify your connection string and that LocalDB is installed.
- **Ports busy:** Restart IIS Express or Visual Studio, or change project port settings.

---

## License

Specify your project license here.

---

## Contact

Your Name — your.email@example.com

Project repository: https://github.com/yourusername/GadgetHub
