Tab groups let you organize the tabs in a window the way Chrome and Firefox do. A named, colored chip heads each group, and its member tabs sit next to the chip in the tab bar. Use groups to keep related tabs together, tell projects apart at a glance, and tuck a set of tabs out of the way without closing them.

## Creating a Group

Right-click a tab and choose **Add Tab to Group > New Group…**. iTerm2 asks for a name (it suggests the tab's current title) and gives the new group a color. The tab moves next to its new chip.

To add another tab to a group that already exists, right-click that tab and choose **Add Tab to Group** and then the group's name from the submenu. A checkmark marks the group the tab already belongs to. To take a tab back out, right-click it and choose **Remove Tab from Group**.

The members of a group always stay contiguous in the tab bar, so adding a tab from elsewhere moves it next to the rest of the group.

## Managing a Group

Right-click a group's chip to act on the whole group:

- **Rename Group…** changes its name.
- The **color swatches** just below Rename recolor the group; pick a preset or open the full color picker.
- **Duplicate Group** makes a copy of the group and its tabs.
- **Move Group to New Window** tears the whole group off into its own window.
- **Remove All Tabs from Group** ungroups the tabs, leaving them in place without a chip.
- **Close Group** closes every tab in the group.

You can rearrange groups by dragging. Drag a chip to move the entire group within its window or into another window. Drag a single tab to move it around inside its group, into a different group, or out of a group entirely. A tab dragged out of the tab bar into empty space becomes an ungrouped tab in a new window.

## Collapsing a Group

Click a group's chip (or choose **Collapse Group** from its menu) to hide the group's tabs behind the chip. The chip then shows how many tabs it holds. Click the chip again, or choose **Expand Group**, to bring the tabs back. Collapsing and expanding are animated.

Selecting a tab that lives in a collapsed group automatically expands the group, so the active tab is never hidden. For the same reason, a group cannot collapse when it is the only group of tabs in the window.

Collapsing works on both horizontal and vertical tab bars and in every theme.

## Persistence

A group carries its name and color with its member tabs, so the grouping survives everything that saves and restores windows, including window arrangements and restart. A group's collapsed or expanded state persists across restarts as well.
