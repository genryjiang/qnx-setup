# QNX Setup Repository


This repo is a comprehensive setup guide to get QNX OS 8.0 to run on WSL2 or macOS. While SR8's main computer will have alot more functionality provided (hopefully) through SDK's (e.g. driveOS SDK, DriveWorks SDK), it is still important to familiarise yourself with (what is hopefully) SR8's production environment.

This repository provides step-by-step instructions, configuration files, and automated setup scripts to help developers quickly establish a working QNX development environment across different platforms.

## Supported Platforms

- **macOS** - QNX development setup for Apple Silicon and Intel Macs
- **Windows WSL** - QNX development environment within Windows Subsystem for Linux
- **Windows 10/11**: If you are using Windows 10/11, just download the SDP + Momentics IDE and follow the tutorials found [here](https://www.youtube.com/watch?v=s8_rvkSfj10&t).

## Requirements
Before continuing, please ensure you have the following downloaded:
- Java Runtime 17 (required for the System Profiler)
- CMake (for CMake project types)
- Installation of Microsoft Visual Studio Code (of course)
- Ubuntu 20.04, Ubuntu 22.04, or Red Hat Enterprise Linux 9

## Quick Start

Choose your platform and follow the corresponding setup guide:

### macOS Setup
```bash
# Clone the repository
git clone https://github.com/genryjiang/qnx-setup.git
cd qnx-setup

# Run the macOS setup script
./scripts/setup-macos.sh
```

### WSL Setup
```bash
# Clone the repository
git clone https://github.com/genryjiang/qnx-setup.git
cd qnx-setup

# Run the WSL setup script
./scripts/setup-wsl.sh
```

## What's Included

- QNX Software Development Platform (SDP) installation
- Cross-compilation toolchain setup
- IDE configuration (VS Code, Eclipse)
- Debugging tools configuration
- Virtual machine setup for target testing
- Development workflow optimization

## Prerequisites

### For macOS:
- macOS 10.15 or later
- Homebrew package manager
- Xcode Command Line Tools

### For WSL:
- Windows 10/11 with WSL2 enabled
- Ubuntu 20.04 LTS or later
- At least 8GB of available disk space

## Contributing

Contributions are welcome! Please read our contributing guidelines before submitting pull requests.

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test on your target platform
5. Submit a pull request

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Support

If you encounter issues or have questions:

1. Check the [troubleshooting guide](docs/troubleshooting.md)
2. Search existing [issues](https://github.com/genryjiang/qnx-setup/issues)
3. Create a new issue with detailed information about your environment and problem
