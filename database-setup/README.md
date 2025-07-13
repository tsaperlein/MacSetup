# Database Setup Guide

This folder contains scripts and documentation for setting up database servers and management applications on your MacBook Pro.

## What This Script Installs

### Database Servers (via Homebrew)

- **PostgreSQL** - Open-source relational database
- **MySQL** - Popular relational database management system
- **MariaDB** - MySQL-compatible database server (alternative to MySQL)
- **MongoDB** - NoSQL document database

### Database Management Applications

- **MongoDB Compass** - Official MongoDB GUI tool
- **MySQL Workbench** - Official MySQL administration tool
- **pgAdmin 4** - PostgreSQL administration and development platform

### Manual Installation Required

- **Oracle SQL Developer** - Must be downloaded manually from Oracle's website

## How to Run the Installation Script

### Prerequisites

1. **Homebrew must be installed** on your system
   - If not installed, visit: https://brew.sh/
   - Or run: `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`

### Installation Steps

1. **Navigate to the database-setup folder:**
   ```bash
   cd /Users/tsaperlein/Desktop/GitHub\ Projects/MacSetup/database-setup
   ```

2. **Make the script executable:**
   ```bash
   chmod +x install-databases.sh
   ```

3. **Run the installation script:**
   ```bash
   ./install-databases.sh
   ```

The script will:
- Update Homebrew
- Install all database servers
- Install all management applications (except Oracle SQL Developer)
- Start the database services
- Provide status updates and success messages

## What Happens After Installation

### Automatic Service Startup

The script automatically starts these services:
- **PostgreSQL** (port 5432)
- **MySQL** (port 3306)
- **MongoDB** (port 27017)

### MariaDB Note

MariaDB is installed but not started automatically to avoid conflicts with MySQL. If you prefer MariaDB over MySQL:

```bash
# Stop MySQL and start MariaDB
brew services stop mysql
brew services start mariadb
```

## Managing Database Services

### Start/Stop Services

```bash
# PostgreSQL
brew services start postgresql
brew services stop postgresql

# MySQL
brew services start mysql
brew services stop mysql

# MariaDB
brew services start mariadb
brew services stop mariadb

# MongoDB
brew services start mongodb-community
brew services stop mongodb-community
```

### Check Service Status

```bash
brew services list | grep -E "(postgresql|mysql|mariadb|mongodb)"
```

## Database Configuration

### PostgreSQL Setup

1. **Create a database:**
   ```bash
   createdb mydatabase
   ```

2. **Connect to PostgreSQL:**
   ```bash
   psql postgres
   ```

3. **Create a user:**
   ```sql
   CREATE USER myuser WITH PASSWORD 'mypassword';
   GRANT ALL PRIVILEGES ON DATABASE mydatabase TO myuser;
   ```

### MySQL Setup

1. **Secure MySQL installation:**
   ```bash
   mysql_secure_installation
   ```

2. **Connect to MySQL:**
   ```bash
   mysql -u root -p
   ```

3. **Create a database and user:**
   ```sql
   CREATE DATABASE mydatabase;
   CREATE USER 'myuser'@'localhost' IDENTIFIED BY 'mypassword';
   GRANT ALL PRIVILEGES ON mydatabase.* TO 'myuser'@'localhost';
   FLUSH PRIVILEGES;
   ```

### MongoDB Setup

MongoDB runs without initial authentication. To connect:

```bash
mongosh
```

## Accessing Management Applications

### MongoDB Compass
- Launch from Applications folder or Spotlight
- Connect to: `mongodb://localhost:27017`

### MySQL Workbench
- Launch from Applications folder or Spotlight
- Create new connection to: `localhost:3306`

### pgAdmin 4
- Launch from Applications folder or Spotlight
- Access via web browser (usually opens automatically)
- Create server connection to: `localhost:5432`

## Oracle SQL Developer

Oracle SQL Developer must be downloaded manually:

1. Visit: https://www.oracle.com/database/sqldeveloper/technologies/download/
2. Download the macOS version
3. Install according to Oracle's instructions
4. Note: May require Oracle account registration

## Troubleshooting

### Port Conflicts

If you encounter port conflicts:

```bash
# Check what's running on specific ports
lsof -i :5432  # PostgreSQL
lsof -i :3306  # MySQL/MariaDB
lsof -i :27017 # MongoDB
```

### Service Won't Start

```bash
# Check service logs
brew services list
tail -f /usr/local/var/log/postgresql.log  # PostgreSQL logs
tail -f /usr/local/var/log/mysql/error.log # MySQL logs
```

### Reinstalling Services

```bash
# Completely remove and reinstall a service
brew services stop postgresql
brew uninstall postgresql
brew install postgresql
brew services start postgresql
```

## Uninstalling

To remove all installed databases:

```bash
# Stop all services
brew services stop postgresql mysql mariadb mongodb-community

# Uninstall servers
brew uninstall postgresql mysql mariadb mongodb-community

# Uninstall management applications
brew uninstall --cask mongodb-compass mysqlworkbench pgadmin4

# Remove MongoDB tap
brew untap mongodb/brew
```

## Security Considerations

1. **Change default passwords** for all database systems
2. **Enable SSL/TLS** for production databases
3. **Configure firewall rules** if databases will be accessed remotely
4. **Regular backups** should be configured for important data
5. **Keep databases updated** with security patches

## Additional Resources

- [PostgreSQL Documentation](https://www.postgresql.org/docs/)
- [MySQL Documentation](https://dev.mysql.com/doc/)
- [MariaDB Documentation](https://mariadb.org/documentation/)
- [MongoDB Documentation](https://docs.mongodb.com/)
- [Homebrew Services Documentation](https://github.com/Homebrew/homebrew-services)