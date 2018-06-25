# Prune

Filter module auto-loading to only your choice of installed modules.

* Powershell runs faster
* It's quicker and simpler to use

## Problem

I want to quickly tab-complete my input, `Get-I`, to the command that I want, `Get-Item`. However, because I have the `IISAdministration` module installed, I am offered a large number of commands that I do not regularly use:

![Tab completion with unwanted commands](docs/img/UnwantedCommands.png "Tab completion with unwanted commands")

## Solution

I import ModuleFilter and cut down the unwanted modules from my autoload setting. Now I have a much more tailored list of commands:

![Tab completion without unwanted commands](docs/img/PrunedCommands.png "Tab completion without unwanted commands")

## Background

Powershell version 3 introduced the concept of module autoloading. An environment variable called PSModulePath defines list of paths that powershell will check for modules.

Any modules found in those paths are _treated as if they are loaded_ for command resolution; that means that when you start typing a command, you can tab-complete it as if the command was present in the session. (The module is actually loaded at the point where you invoke tyhe command).

This is a great convenience, but can be a problem for users who have large and sprawling modules installed. For example, people who work with the Azure modules commonly report that tab-completion stops being useful because the number of irrelevant completion options increases so much.

It also becomes much slower to perform tab completion.

The mechanism to control this is the PSModulePath variable. _Prune_ is a powershell module to edit this variable to filter out modules that don't need to pollute your session.

# Usage

## To apply a filter to module autoloading:

```powershell
Import-Module Prune
Select-AutoloadModules
```
The above command opens a GridView GUI, showing all currently-available modules. Select the modules that you wish to leave available for autoloading.

Modules that you don't select will no longer be available for tab-completion or for running commands, unless you explicitly load them.

This command will save a configuration to the module base folder.

## To remove the filter on module autoloading:

```powershell
Remove-Module Prune
```

When you unload Prune with `Remove-Module`, your previous settings are restored.

If you close and re-open Powershell, your previous settings are restored. Prune does not make permanent changes - but see below for how to add Prune to your profile.

## To re-apply your previous filter on module autoloading:

```powershell
Import-Module Prune
```

On loading the module, if you have previously run `Select-AutoloadModules`, your configuration will be re-applied.

## To make Prune permanent:

Prune does not make persistent changes. However, when loaded, it does re-apply your previous settings. Therefore, you can make Prune persist by adding the following line to your Powershell profile:

```powershell
Import-Module <path to Prune>
```

This is typically done for both console and ISE profiles, for users of ISE.

# Contributions

Contributions to development are welcome. You can submit an issue, you can fork code and send pull requests. If you do not submit an issue, I suggest contacting me before sending pull requests to give some context. I can be reached on the [Powershell](https://powershell.slack.com) or [PSUG-UK](https://get-psuguk.slack.com/) slack group, where my handle is `@freddie_sackur`.