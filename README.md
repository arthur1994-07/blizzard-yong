# blizzard-yong
Blizzard yong GS EP12 version

building dependency chain

SigmaCore
    │
    ├──────────────────┐
    │                  │
  EngineLib          (direct)
    │
    ├──────────────────┐
    │                  │
  RanLogic          RanGfxUI
    │                  │
    │         RanLogicClient
    │                  │
    │               RanUI
    │                  │
    ├──────────────────┤
    │                  │
RanLogicServer    TestConsole
    │             (RanClient.exe)
    │
AgentServer
FieldServer
LoginServer
CacheServer
SessionServer
AuthServer