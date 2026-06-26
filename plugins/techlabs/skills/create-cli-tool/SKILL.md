# create-cli-tool

Build CLI tools with Go Cobra or Rust clap.

## When to Use
- Developer tools
- Automation scripts
- System utilities

## Execution

### Step 1: Go CLI with Cobra
```go
package main

import (
    "fmt"
    "os"
    "github.com/spf13/cobra"
)

var rootCmd = &cobra.Command{
    Use:   "mytool",
    Short: "A brief description of your tool",
}

var serveCmd = &cobra.Command{
    Use:   "serve [port]",
    Short: "Start the server",
    Args:  cobra.MaximumNArgs(1),
    RunE: func(cmd *cobra.Command, args []string) error {
        port := "8080"
        if len(args) > 0 {
            port = args[0]
        }
        return startServer(port)
    },
}

func init() {
    rootCmd.AddCommand(serveCmd)
    serveCmd.Flags().BoolP("verbose", "v", false, "Verbose output")
}

func main() {
    if err := rootCmd.Execute(); err != nil {
        fmt.Fprintln(os.Stderr, err)
        os.Exit(1)
    }
}
```

### Step 2: Add Shell Completion
```go
var completionCmd = &cobra.Command{
    Use:   "completion [bash|zsh|fish]",
    Short: "Generate shell completion",
    RunE: func(cmd *cobra.Command, args []string) error {
        switch args[0] {
        case "bash":
            return rootCmd.GenBashCompletion(os.Stdout)
        case "zsh":
            return rootCmd.GenZshCompletion(os.Stdout)
        }
        return nil
    },
}
```

## Output
- CLI scaffold
- Command registration
- Shell completion
- Help documentation
