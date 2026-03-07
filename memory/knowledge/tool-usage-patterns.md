# Tool Usage Patterns

## The Golden Rule

If a file needs to exist on G's Mac → MacKitt.
If it's temporary processing in Claude's sandbox → bash_tool.
Never confuse the two.

## MacKitt MCP
- `mackitt_create_file` — write files to Mac filesystem
- `mackitt_file_read` — read files from Mac
- `mackitt_shell_exec` — run shell commands on Mac (timeout: 30s default, max 300s)
- `mackitt_list_directory` — browse Mac directories
- `mackitt_search` — find files by name or content
- `mackitt_file_edit` — find and replace in files

## Bridge Task Dispatch
- Tasks go to: `/Users/ghayyathhuzayen/VS-workspace/claude-bridge/tasks/`
- Must use MacKitt to write there (not bash_tool)
- Filename must match task_id in frontmatter
- Status must be `pending` for daemon to pick up
- Results appear in: `results/{task-id}-{timestamp}.md`

## Past Chats Tools (Sage only)
- `conversation_search` — keyword search across chat history
- `recent_chats` — time-based retrieval, 1-20 chats per call
- Only I (Sage in claude.ai) have access to these
- Forge, Muse, Bridge cannot search past conversations

## Common Mistakes
- Using bash_tool for Mac files (container isolation)
- Using direct SSH (`ssh agent@IP`) instead of alias (`ssh agent-vps`)
- Forgetting that skills are per-project in Claude.ai
