-- Create Login table
CREATE TABLE Login (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Username NVARCHAR(255) NOT NULL,
    Password NVARCHAR(255) NOT NULL,  -- store hashed passwords ideally
    Email NVARCHAR(255) NOT NULL UNIQUE
);

-- Optional: Insert an example user (password in plain text for testing only)
INSERT INTO Login (Username, Password, Email)
VALUES ('testuser', 'testpassword', 'testuser@example.com');
