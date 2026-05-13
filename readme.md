# Benlo Enterprise Infrastructure

## Overview

This repository contains the Infrastructure as Code (IaC) implementation for the Benlo Enterprise platform using Terraform on Microsoft Azure.

The objective of this project is to build a scalable, secure, production-ready, and modular Azure infrastructure following enterprise-grade DevOps and cloud architecture best practices.

---

# Project Goals

The team is expected to:

- Build Azure infrastructure using Terraform
- Follow a fully modular architecture
- Support multiple environments
- Use reusable Terraform modules
- Use `for_each` wherever applicable for scalable resource creation
- Maintain clean and production-grade folder structure
- Implement secure and scalable networking
- Enable monitoring, logging, and alerting
- Follow naming conventions and tagging standards

---

# Mandatory Azure Services

The following Azure services must be included in the infrastructure implementation.

## Networking

- Virtual Network (VNet)
- Subnets
- Network Security Groups (NSG)
- Route Tables
- Public IPs
- Private Endpoints
- NAT Gateway (if required)

---

## Traffic Management

- Application Gateway (WAF Enabled)
- Azure Load Balancer
- DNS Configuration

---

## Compute

- Virtual Machine Scale Sets (VMSS)
- Availability Zones / Availability Sets
- Bastion Host (optional but recommended)

---

## Storage

- Storage Accounts
- Blob Containers
- File Shares (if required)

---

## Database

At least one database service should be implemented:

- Azure SQL Database
OR
- PostgreSQL Flexible Server
OR
- MySQL Flexible Server

Database should support:

- Backup strategy
- High availability
- Private networking
- Monitoring

---

## Security

- Key Vault
- Managed Identities
- RBAC
- NSGs
- WAF Policies
- Diagnostic Settings

---

## Monitoring & Observability

- Azure Monitor
- Log Analytics Workspace
- Application Insights
- Alerts & Action Groups
- Diagnostic Logs

---

# Terraform Requirements

## Modular Approach

Infrastructure must be split into reusable modules.

Example:

```bash
/modules
    /network
    /application_gateway
    /vmss
    /load_balancer
    /storage_account
    /database
    /monitoring
    /keyvault
