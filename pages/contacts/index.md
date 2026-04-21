---
title: Delphi Contacts
layout: default
---

# Table of Contents

- [Introduction](#introduction)

- [Development Roadmap](#development-roadmap)
  - [Phase I - UI Skeleton](#phase-i---ui-skeleton)
  - [Phase II - In Memory Logic](#phase-ii---in-memory-logic)
  - [Phase III - DB Integration](#phase-iii---db-integration)
  - [Phase IV - Replace the In-Memory List with the DB](#phase-iv---replace-the-in-memory-list-with-the-db)
  - [Phase V - Extend the App](#phase-v---extend-the-app)
  - [Phase VI - Code Review](#phase-vi---code-review)
  - [Phase VII - Documentation](#phase-vii---documentation)

- [Links](#links)

---

# Introduction

The goal is to create a simple contacts application that stores names and phone numbers. The backend will be a SQLite database. 

## Success Criteria

- Add, list, and delete contacts with data persisted in SQLite

---

# Development Roadmap

## Principles

- Keep it simple
- Prefer clarity over features
- Build in small, testable increments

## Phase I - UI Skeleton

Create a simple form that contains:
- edtName
- edtPhoneNumber
- btnAdd
- btnDelete
- btnRefresh
- lstContacts

## Phase II - In Memory Logic

Fake the backend; implement an in-memory store to simulate persistence.
- Store contacts in a list
- Implement
  - Add > Push to the list
  - Refresh > Display the list
  - Delete > Remove the selected entry

## Phase III - DB Integration

Setup SQLite.
- Use SQLite via FireDAC (no external server dependency)
- Create the DB 
- Create the DB table
- Implement insert, select, delete
- Remove the temporary list
- Refresh reads from the DB

## Phase IV - Extend the App

Add a few small enhancements:
- Split *name* into *first name* and *last name*
- Confirm delete feature
- Replace the `lstContacts` `TListBox` with `TListView`
- Auto-refresh the contacts on delete
- Auto-refresh the contacts on app startup
- Add database problem handling

## Phase V - Code Review

- Code review
  - Variable names
  - Ensure code is readable; add comments if necessary

## Phase VI - Documentation

Create documentation for this application:
- What it does
- Tech stack
- Design notes
- Next steps, if I were to continue

---

# Links

- [GitHub Repo](https://github.com/NadimGhaznavi/delphi) with [Contacts code](https://github.com/NadimGhaznavi/delphi/contacts)
