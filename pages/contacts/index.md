---
title: Delphi Contacts
layout: default
---

# Table of Contents

- [Introduction]
- [Development Roadmap](#roadmap)

---

# Introduction

The goal is to create a simple contacts application that stores names and phone numbers. The backend will be a SQLite database. 

---

# Development Roadmap

## Phase I - UI Skeleton

Create a simple form that contains:
- edtFirstName
- edtLastName
- edtPhoneNumber
- btnAdd
- btnDelete
- btnRefresh
- lstContants / TListView

## Phase II - In Memory Logic

Fake the backend.
- Store contacts in a list
- Implement
  - Add > Push to the list
  - Refresh > Display the list
  - Delete > Remove the selected entry

## Phase III - DB Integration

Setup SQLite.
- Create the DB 
- Create the DB table
- Implement insert, select, delete

## Phase IV - Replace the In-Memory List with the DB

- Remove the temporary list
- Everything goes through the DB
- Refresh reads from the DB

## Phase V - Extend the App

Add a couple of features:
- Confirm delete feature
- Handle no selection on delete

## Phase VI - Code Review

- Code review
  - Variable name
  - Event handlers
  - Maybe implement helper functions
- Ensure code is commented, where appropriate

## Phase VII - Documentation

Create documentation for this application:
- What it does
- Tech stack
- Design notes
- Next steps, if I were to continue


