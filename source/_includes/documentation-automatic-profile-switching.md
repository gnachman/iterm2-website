iTerm2 can use information it knows about your current path, host name, user name, and foreground job name to change profiles. For example, your window's background color or the terminal's character encoding could change when connecting to different hosts.

### Shell Integration Required
You must install <a href="documentation-shell-integration.html">Shell Integration</a> on all machines and all user accounts where you plan to use Automatic Profile Switching (either by using the scripts or the Triggers workaround described in the Shell Integration docs).

#### Rule Syntax
In *Settings&gt;Profiles&gt;Advanced*, you may specify a set of rules.

<img src="/images/AutomaticProfileSwitching.png">

When any session satisfies a rule in a given profile, it will switch to that profile. Rules consist of three optional components: the user name, the hostname, and the path. At least one component must be present, since an empty rule is not allowed. The hostname is required only when both a user name and a path are specified.

A user name is a unix account name (e.g., *root*) followed by an `@`.

A path always begins with a `/`. Any time a hostname is followed by a path, they are separated by a `:`. For example, `iterm2.com:/users/george`. It may include `*` wildcards.

A hostname can be a DNS name, like `iterm2.com` or an IP address like `127.0.0.1`. A hostname may contain one or more `*` characters, which act as a wildcard (like globbing in Unix).

The job name is the name of the executable. For example, "vim" or "bash". It must be prefixed with an ampersand `&`. For example, `&emacs*`. Starting with version 3.6, the rule is matched against the full command line rather than only the job name.

Additionally, a rule may be designated as sticky by beginning with a `!`. This will be described below, in the *Automatic Reversion* section.

Some examples:

  * `george@iterm2.com:/users/george`
  * `george@*:/users/george`
  * `*:/users/george`
  * `*.iterm2.com:/users/george`
  * `dev.*.com:/users/george`
  * `george@iterm2.com`
  * `iterm2.com`
  * `george@`
  * `iterm2.com:/users/george`
  * `/users/george`
  * `/users/*`
  * `&vim`
  * `iterm2.com&vim`
  * `!iterm2.com`

Because more than one rule may match at any given time, rules with higher
quality matches prevail over those with lower-quality matches. Quality is
determined by a rule's score, which is computed by summing the scores for its
matching parts. In order for a rule to be considered, all of its parts that are
specified must match the current state.

#### Scoring

Scores are additive. Each matching component contributes points:

| Component | Match Type | Base Score |
|-----------|------------|------------|
| Hostname | Exact match | 32 |
| Hostname | Glob pattern (e.g., `*.example.com`) | 16 × (1 + length factor) |
| Hostname | `*` alone (catch-all) | 1 |
| Job | Glob match on job name or command line | 8 |
| Username | Exact match | 4 |
| Path | Exact match | 2 |
| Path | Glob pattern | 0 + length factor |

**Length factor**: For glob patterns, longer patterns score slightly higher. The formula is `length / (length + 1)`, which approaches 1 for long patterns. This ensures `*.internal.example.com` beats `*.example.com`.

**Zero means no match**: If any specified component fails to match, the entire rule scores 0 (no match).

**Unspecified components don't penalize**: Only components you specify affect matching. An empty hostname field matches any hostname without reducing your score.

#### Example Scores

| Rule | Approximate Score |
|------|-------------------|
| `*` (catch-all) | 1 |
| `/home/user/projects` (exact path) | 2 |
| `admin@` (username only) | 4 |
| `*.example.com` (hostname glob) | ~16.9 |
| `server.example.com` (exact hostname) | 32 |
| `admin@server.example.com` | 36 |

#### Custom Expressions

For complex logic, use expressions instead of the standard rule fields. Your expression returns the score directly. To outrank standard rules, return values greater than 64 (the maximum standard score). Return 0 for no match.

The highest scoring rule, if any, will be used and the session's profile will be switched.

The UI tries to prevent you from entering the same rule in two different profiles, but if that does happen then one profile is chosen arbitrarily.

### Automatic Reversion

After APS switches a session's profile, its rules may eventually cease to match
(for example, the hostname changes back to "localhost" because an ssh session
ends). If no profile has a matching rule, the session's original profile will
be restored. The exception is if the last-matched rule was "sticky". A sticky
rule is prefixed with an `!`.

#### Implementation

Each session maintains a stack of profiles. Initially, the stack contains the profile the session was created with. When the username, hostname, or path changes, iTerm2 finds the best-matching profile. If some profile has a matching rule, one of two things happens:

  * If that profile is already on the stack, profiles above that one will be removed from the stack and the session will switch to that profile.
  * Failing that, the profile will be pushed on the stack and the session will switch to that profile.

If no profile has a matching rule, the stack is emptied (except for the first entry, the original profile for the session) and the session reverts to its original profile.

Rules may begin with ! to indicate "stickiness". A sticky rule causes its profile to stay even after the rule no longer applies, so long as no other rule matches.

### Triggers

Since it's impractical to install shell integration everywhere (for example, as *root*), there will be times when you need to write a trigger to detect the current username or hostname. Please see the *Triggers* section of <a href="/shell_integration.html">Shell Integration</a> for details.

### Troubleshooting

There are a few ways things can go wrong. Please see the <a href="https://gitlab.com/gnachman/iterm2/wikis/scp-not-connecting">Why doesn't secure copy/automatic profile switching work?</a> document for help diagnosing and fixing these issues.


