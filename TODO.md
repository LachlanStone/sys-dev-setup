# Current Tasks
1. Rewrite the ./Run Script
    - Update the run script to install the applications with specific directories first
2. Update the Scripts to include a ECHO to explain and confirm the step that is being executed
3. Add some colour to the enviroment


# My Ideas
1. Update the zsh env configuration file
    - Review and optimize aliases
    - Add useful functions
    - Organize the configuration into modular files

2. Create a .tmux.config file
    - Add custom key bindings
    - Configure status bar
    - Set up default session layout

3. Have method that when VPN is enable [WireGuard or Others] are connected that system won't speed
    - This is due when the sleep does happen i lose my WireGuard Connection
        - Close Screen
        - Time for Sleep
    - Goals:
        - Still allow for manual sleep
        - If temps are getting close to TJuntion or to hot to force hibinate





# AI Ideas
1. Environment Setup Improvements
    - Create a backup system for configuration files
    - Add validation checks in the run script to ensure dependencies are met
    - Implement logging for installation processes
    - Add rollback functionality for failed installations

2. Directory Structure Organization
    - Consolidate similar tools in the runs directory (e.g., terminal-related: tmux, wezterm, ghostty)
    - Create a common libs directory for shared resources
    - Add README files in each major directory explaining its purpose

3. Development Environment Enhancements
    - Set up Docker compose for development environments
    - Create development environment templates for different stacks
    - Add automated testing for installation scripts
    - Implement version checking for installed tools

4. Documentation Improvements
    - Add installation guides for each tool
    - Create troubleshooting guides
    - Document configuration options for each tool
    - Add examples of common workflows

5. Quality of Life Features
    - Add shell completion scripts
    - Create quick-setup scripts for different development environments
    - Implement a tool version manager
    - Add system health monitoring scripts
