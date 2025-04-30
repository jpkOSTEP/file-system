# 🗂️ FS: A Custom File System

A lightweight, bitmap-based file system implemented in C. It supports basic file and directory operations, along with indirect pointer support for large files.

## 📦 Features

- Block-based file system using bitmap management for inodes and data blocks
- Support for file and directory operations:
  - `create`, `read`, `write`, `mkdir`, `rmdir`, `unlink`
  - Path-based inode resolution
  - Large file handling via indirect pointers
  - Directory entry table with a fixed size (1 block)

## 🧪 Benchmark Tests

### `simple_test.c`
- Measures basic filesystem setup and file operations
- Tracks blocks used post-execution

### `test_cases.c`
- Tests more complex directory structures and edge cases
- Validates correct block and inode allocation

## 🔧 Key Functions

### Allocation Utilities
- `get_avail_ino()` – Allocates and returns an available inode
- `get_avail_blkno()` – Allocates and returns an available data block

### Inode Operations
- `readi()` – Reads an inode from disk using block and offset
- `writei()` – Writes an inode to disk

### Directory Operations
- `dir_find()` – Checks for a file or subdirectory in a directory
- `dir_add()` – Adds a new entry to a directory
- `dir_remove()` – Removes a directory entry

### File System Initialization
- `fs_mkfs()` – Initializes superblock, root inode, and bitmaps

### File and Directory APIs
- `fs_readdir()` – Lists contents of a directory
- `fs_mkdir()` – Creates a new directory
- `fs_rmdir()` – Removes an empty directory
- `fs_create()` – Creates a new file (no initial data blocks)
- `fs_write()` – Writes data to a file (uses indirect pointers if needed)
- `fs_read()` – Reads data from a file
- `fs_unlink()` – Deletes a file (no content checks)

### Path Resolution
- `get_inode_by_path()` – Traverses the path and retrieves the corresponding inode

## 📁 Large File Support

Indirect pointers are used when data exceeds the range of direct pointers:
- Indirect blocks hold references to additional data blocks
- Both read and write operations handle indirect access with fallback logic

## ⚠️ Limitations & Notes

- Directory entry table supports up to 17 entries (fits within one data block)
- `fs-large-files.c` contains additional logic for indirect pointer support
- The `Makefile` has been updated to include all necessary dependencies

## 🛠️ Build Instructions

From the root directory:
```bash
make  # Builds the file system
```