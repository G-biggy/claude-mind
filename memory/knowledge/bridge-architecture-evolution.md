# Bridge Architecture Evolution

## Timeline of Key Decisions

### Feb 11: Original Design
- VPS-centric: daemon on VPS detects tasks, triggers CC
- Problem: CC CLI only exists on Mac, not VPS
- DeepSeek API for cost-effective background processing

### Feb 14: The "Always-On" Problem
- Realized VPS can't trigger CC on Mac when laptop is off
- Considered installing CC on VPS (rejected: API costs)
- Considered SSH reverse tunnels (too complex)

### Feb 16: The Local Daemon Breakthrough
- Solution: run the daemon ON THE MAC, not the VPS
- Tasks sync via GitHub to Mac
- Mac daemon (launchd) watches local tasks/ directory
- CC executes locally using Pro subscription = $0 API cost
- VPS serves monitoring dashboard and sync only

### Feb 17: Skills & Monitoring
- Built monitor dashboard at bridge.ghayyath.com
- Created task-dispatch skill for Claude.ai
- Explored adversarial agent patterns

### Feb 28: Phase-Level Monitoring
- Upgraded from task-level to phase-level tracking
- Real-time stdout streaming with `--output-format stream-json`
- Blocker detection and reply mechanism
- Monitor URL format fixed (was using wrong route pattern)

## Architecture Settled

```
Claude.ai (Sage) → creates task.md via MacKitt
  → Mac daemon detects (launchd, ~30s polling)
    → CC CLI executes (--dangerously-skip-permissions)
      → macOS notification on completion
        → Result written to results/
          → GitHub syncs to VPS
            → Monitor dashboard shows progress
```

## Cost Model
- Mac execution: $0 (Pro subscription)
- VPS: existing server, no additional cost
- GitHub: free tier
- DeepSeek: minimal API costs for background processing
