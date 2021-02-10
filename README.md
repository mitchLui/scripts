# 1. Scripts

This repository stores all of the scripts I use. Also contains some boilerplate code that I use quite often.

- [1. Scripts](#1-scripts)
  - [1.1. `setup.sh`](#11-setupsh)
    - [1.1.1. Usage](#111-usage)
  - [1.2. `build_container.sh`](#12-build_containersh)
    - [1.2.1. Usage](#121-usage)
  - [1.3. `compose_up.sh`](#13-compose_upsh)
    - [1.3.1. Usage](#131-usage)

## 1.1. `setup.sh`

This is a script I use to set up a new Mac for development and installs the following:

- Xcode Command Line Tools
- Homebrew and libraries / casks
- pip packages

It also sets up: 

- bash environment
- custom shell profile
- system preferences

### 1.1.1. Usage

```sh
./setup.sh
```

## 1.2. `build_container.sh`

Used to build containers in Docker. This script was written by an ex-colleague of mine and I have used it ever since (I made some improvements of my own though).

### 1.2.1. Usage

```sh
./build_container.sh PORT
```

| Argument | Description   | Example | Default Value |
| -------- | ------------- | ------- | ------------- |
| PORT     | Incoming port | 80      | 80            |

## 1.3. `compose_up.sh`

Sets up a multi-container Docker application using Compose.

### 1.3.1. Usage

```sh
./compose_up.sh
```