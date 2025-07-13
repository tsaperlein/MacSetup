#!/bin/bash

# Database Setup Script for MacBook Pro
# This script installs database servers and management applications

set -e

echo "🗄️  Starting Database Setup..."
echo "================================"

# Color codes for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to print colored output
print_status() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Check if Homebrew is installed
if ! command -v brew &> /dev/null; then
    print_error "Homebrew is not installed. Please install Homebrew first."
    echo "Visit: https://brew.sh/"
    exit 1
fi

print_success "Homebrew is installed"

# Update Homebrew
print_status "Updating Homebrew..."
brew update

echo ""
echo "📊 Installing Database Servers..."
echo "================================"

# Install PostgreSQL
print_status "Installing PostgreSQL..."
if brew list postgresql &> /dev/null; then
    print_warning "PostgreSQL is already installed"
else
    brew install postgresql
    print_success "PostgreSQL installed successfully"
fi

# Install MySQL
print_status "Installing MySQL..."
if brew list mysql &> /dev/null; then
    print_warning "MySQL is already installed"
else
    brew install mysql
    print_success "MySQL installed successfully"
fi

# Install MariaDB (alternative to MySQL)
print_status "Installing MariaDB..."
if brew list mariadb &> /dev/null; then
    print_warning "MariaDB is already installed"
else
    brew install mariadb
    print_success "MariaDB installed successfully"
fi

# Install MongoDB (for Compass)
print_status "Installing MongoDB..."
if brew list mongodb-community &> /dev/null; then
    print_warning "MongoDB is already installed"
else
    brew tap mongodb/brew
    brew install mongodb-community
    print_success "MongoDB installed successfully"
fi

echo ""
echo "🛠️  Installing Database Management Applications..."
echo "================================================"

# Install MongoDB Compass
print_status "Installing MongoDB Compass..."
if brew list --cask mongodb-compass &> /dev/null; then
    print_warning "MongoDB Compass is already installed"
else
    brew install --cask mongodb-compass
    print_success "MongoDB Compass installed successfully"
fi

# Install MySQL Workbench
print_status "Installing MySQL Workbench..."
if brew list --cask mysqlworkbench &> /dev/null; then
    print_warning "MySQL Workbench is already installed"
else
    brew install --cask mysqlworkbench
    print_success "MySQL Workbench installed successfully"
fi

# Install pgAdmin (PostgreSQL management tool)
print_status "Installing pgAdmin..."
if brew list --cask pgadmin4 &> /dev/null; then
    print_warning "pgAdmin is already installed"
else
    brew install --cask pgadmin4
    print_success "pgAdmin installed successfully"
fi

# Note about Oracle SQL Developer
echo ""
print_warning "Oracle SQL Developer must be downloaded manually from Oracle's website"
print_status "Visit: https://www.oracle.com/database/sqldeveloper/technologies/download/"

echo ""
echo "🚀 Setting up database services..."
echo "================================="

# Start PostgreSQL service
print_status "Starting PostgreSQL service..."
brew services start postgresql
print_success "PostgreSQL service started"

# Start MySQL service
print_status "Starting MySQL service..."
brew services start mysql
print_success "MySQL service started"

# Note about MariaDB (don't start both MySQL and MariaDB)
print_warning "MariaDB is installed but not started (conflicts with MySQL)"
print_status "To use MariaDB instead of MySQL, run: brew services stop mysql && brew services start mariadb"

# Start MongoDB service
print_status "Starting MongoDB service..."
brew services start mongodb-community
print_success "MongoDB service started"

echo ""
echo "✅ Database Setup Complete!"
echo "=========================="
echo ""
echo "Installed Database Servers:"
echo "• PostgreSQL (running on port 5432)"
echo "• MySQL (running on port 3306)"
echo "• MariaDB (installed, not running)"
echo "• MongoDB (running on port 27017)"
echo ""
echo "Installed Management Applications:"
echo "• MongoDB Compass"
echo "• MySQL Workbench"
echo "• pgAdmin 4"
echo ""
echo "📝 Next Steps:"
echo "1. Configure your databases as needed"
echo "2. Create databases and users"
echo "3. Download Oracle SQL Developer manually if needed"
echo "4. Check the README.md for detailed usage instructions"
echo ""
print_success "All database tools have been installed successfully!"