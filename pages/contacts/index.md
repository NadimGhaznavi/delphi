---
title: Delphi Contacts
layout: default
---

![Contacts App](/images/contacts.png)

---

# Table of Contents

- [Introduction](#introduction)

- [Design Notes](#design-notes)

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

The goal is to build a simple contacts application with a SQLite backend, demonstrating a complete UI-to-database workflow.

## Success Criteria

- Add, list, and delete contacts with data persisted in SQLite
- Clean, structured implementation using Delphi (FireDAC + VCL)

---

# Design Notes

- The application was built incrementally, starting with an in-memory model and transitioning to a database-backed implementation.
- UI structure was refactored (ListBox → ListView) to better align with the underlying data model.
- Emphasis was placed on clarity and simplicity over feature completeness.

---

# Development Roadmap

## Principles

- Keep it simple
- Prefer clarity over features
- Build in small, testable increments

## Phase I - UI Skeleton

Create a simple form that contains:
- Name
- Phone Number
- Add Button
- Delete Button
- Refresh Button
- Contacts List Box

## Phase II - In Memory Logic

Simulate persistence using an in-memory store.
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
- Replace the in-memory store with the database
- Update UI to read directly from the DB

## Phase IV - Extend the App

Add a few small enhancements:
- Split *name* into *first name* and *last name*
- Confirm delete feature
- Replace the `TListBox` with `TListView` to support structured data display
- Auto-refresh the contacts on app startup
- Auto-refresh the contacts on add
- Auto-refresh the contacts on delete
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

- [GitHub Repo](https://github.com/NadimGhaznavi/delphi)
  - [Contacts code](https://github.com/NadimGhaznavi/delphi/contacts)
