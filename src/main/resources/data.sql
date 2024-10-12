-- Drop tables if they exist
IF OBJECT_ID('dbo.Authorities', 'U') IS NOT NULL
    DROP TABLE dbo.Authorities;

IF OBJECT_ID('dbo.Users', 'U') IS NOT NULL
    DROP TABLE dbo.Users;

-- Create Users table
CREATE TABLE dbo.Users (
    username VARCHAR(50) NOT NULL PRIMARY KEY,
    password VARCHAR(500) NOT NULL,
    enabled BIT NOT NULL
);

-- Create Authorities table
CREATE TABLE dbo.Authorities (
    username VARCHAR(50) NOT NULL,
    authority VARCHAR(50) NOT NULL,
    enabled BIT NOT NULL CONSTRAINT df_users_enabled DEFAULT 1  -- Changed 'boolean' to 'bit' for MS SQL

    CONSTRAINT fk_authorities_users FOREIGN KEY (username)
        REFERENCES dbo.Users (username)
);

-- Create unique index on Authorities
CREATE UNIQUE INDEX ix_auth_username
ON dbo.Authorities (username, authority);
