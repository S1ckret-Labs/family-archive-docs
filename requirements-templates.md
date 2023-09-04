# Requirement templates

[The EARS templates](https://alistairmavin.com/ears/) in markdown.

The word `system` means system or container or component.

## Generic EARS syntax

While `<optional pre-condition>`, when `<optional trigger>`, the `<system name>` shall `<system response>`.

> The EARS ruleset states that a requirement must have: Zero or many preconditions; Zero or one trigger; One system name; One or many system responses.

## Ubiquitous requirements

The `<system name>` shall `<system response>`.

> Ubiquitous requirements are always active (so there is no EARS keyword)

## State driven requirements

While `<precondition(s)>`, the `<system name>` shall `<system response>`.

> State driven requirements are active as long as the specified state remains true and are denoted by the keyword While.

## Event driven requirements

When `<trigger>`, the `<system name>` shall `<system response>`.

> Event driven requirements specify how a system must respond when a triggering event occurs and are denoted by the keyword When.

## Optional feature requirements

Where `<feature is included>`, the `<system name>` shall `<system response>`.

> Optional feature requirements apply in products or systems that include the specified feature and are denoted by the keyword Where.

## Unwanted behaviour requirements

If `<trigger>`, then the `<system name>` shall `<system response>`.

> Unwanted behaviour requirements are used to specify the required system response to undesired situations and are denoted by the keywords If and Then.

