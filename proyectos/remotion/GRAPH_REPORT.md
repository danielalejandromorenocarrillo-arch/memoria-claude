# Graph Report - remotion  (2026-11-18)

## Corpus Check
- 24 files · ~39,297 words
- Verdict: corpus is large enough that graph structure adds value.
- Unclassified: 3 file(s) not represented in the graph (top: (none) 1, .css 1, .iss 1)

## Summary
- 758 nodes · 1198 edges · 31 communities (28 shown, 3 thin omitted)
- Extraction: 94% EXTRACTED · 6% INFERRED · 0% AMBIGUOUS · INFERRED: 69 edges (avg confidence: 0.85)
- Token cost: 0 input · 0 output

## Community Hubs (Navigation)
- SbvProcessor
- Root.tsx
- Params
- app.js
- Tune
- SbvEditor
- engine.js
- Compressor
- PluginProcessor.cpp
- F1Countdown.tsx
- Denoiser
- MultiNS
- init
- clamp
- HostTest.cpp
- Telemetry
- Dsp.h
- NoiseGuard
- initEQ
- toast
- vaFinish
- Biquad
- compilerOptions
- serve.cjs
- Band
- BandType
- Sacrebleu Voces — compilar e instalar el VST3
- Smooth

## God Nodes (most connected - your core abstractions)
1. `SbvProcessor` - 161 edges
2. `Params` - 51 edges
3. `Tune` - 48 edges
4. `SbvEditor` - 28 edges
5. `MultiNS` - 27 edges
6. `Denoiser` - 26 edges
7. `Compressor` - 21 edges
8. `clamp()` - 20 edges
9. `init()` - 19 edges
10. `NoiseGuard` - 19 edges

## Surprising Connections (you probably didn't know these)
- `SbvEditor::SbvEditor()` --references--> `SbvProcessor`  [EXTRACTED]
  sacrebleu-voces/vst/Source/PluginEditor.cpp → sacrebleu-voces/vst/Source/PluginProcessor.h
- `SbvEditor::timerCallback()` --references--> `SbvProcessor`  [INFERRED]
  sacrebleu-voces/vst/Source/PluginEditor.cpp → sacrebleu-voces/vst/Source/PluginProcessor.h
- `SbvProcessor` --references--> `Params`  [EXTRACTED]
  sacrebleu-voces/vst/Source/PluginProcessor.h → sacrebleu-voces/vst/Source/Dsp.h
- `SbvProcessor` --references--> `Biquad`  [EXTRACTED]
  sacrebleu-voces/vst/Source/PluginProcessor.h → sacrebleu-voces/vst/Source/Dsp.h
- `SbvProcessor` --references--> `Compressor`  [EXTRACTED]
  sacrebleu-voces/vst/Source/PluginProcessor.h → sacrebleu-voces/vst/Source/Dsp.h

## Import Cycles
- None detected.

## Communities (31 total, 3 thin omitted)

### Community 0 - "SbvProcessor"
Cohesion: 0.02
Nodes (104): SbvProcessor, airComp, airHP1, airHP2, airOn, airPres, airShelf, charDC (+96 more)

### Community 1 - "Root.tsx"
Cohesion: 0.05
Nodes (62): author, dependencies, react@^19.3.1, react-dom@^19.3.1, remotion@^4.0.543, @remotion/cli@^4.0.543, @remotion/google-fonts@^4.0.543, @remotion/media@^4.0.543 (+54 more)

### Community 2 - "Params"
Cohesion: 0.04
Nodes (44): Params, air, airFreq, bands, bpm, bypass, charMode, color (+36 more)

### Community 3 - "app.js"
Cohesion: 0.05
Nodes (38): airCache, BEAT_LBL, CHAIN, COL, controls, DEFAULTS, EQF, FMT (+30 more)

### Community 4 - "Tune"
Cohesion: 0.05
Nodes (38): Tune, acc, act, amount, analyze, buf, center, cm (+30 more)

### Community 5 - "SbvEditor"
Cohesion: 0.06
Nodes (16): SbvEditor::makeOptions(), SbvEditor::SbvEditor(), SbvEditor::timerCallback(), SbvEditor, fft, kBins, kN, kOrder (+8 more)

### Community 6 - "engine.js"
Cohesion: 0.10
Nodes (27): airGains(), bandQ(), bandStages(), bufferSpectrum(), charFn(), COMP_STYLES, createEngine(), apply() (+19 more)

### Community 7 - "Compressor"
Cohesion: 0.08
Nodes (23): Compressor, aC, attack, extraMakeupDb, grDb, knee, kneeLin, makeupFactor (+15 more)

### Community 8 - "PluginProcessor.cpp"
Cohesion: 0.10
Nodes (13): bandType(), CompStyle, att, knee, r, rel, SbvProcessor::createEditor(), SbvProcessor::licenseFile() (+5 more)

### Community 9 - "F1Countdown.tsx"
Cohesion: 0.13
Nodes (30): BigChromeNumber(), Checkered(), chromeText, f1(), F1Countdown(), FinalCountdown(), fmt(), FPS (+22 more)

### Community 10 - "Denoiser"
Cohesion: 0.09
Nodes (22): Denoiser, amt, cnt, G, H, im, inB, K (+14 more)

### Community 11 - "MultiNS"
Cohesion: 0.10
Nodes (19): MultiNS, acc, accN, amt, blk, cMs, cut, det (+11 more)

### Community 12 - "init"
Cohesion: 0.19
Nodes (21): applySuggestions(), buildFactoryPresets(), buildPresetSel(), cleanSpace(), cols(), commit(), deep(), esc() (+13 more)

### Community 13 - "clamp"
Cohesion: 0.25
Nodes (17): clamp(), drawAir(), drawChar(), drawEQ(), drawMeter(), drawSpace(), drawTone(), drawViz() (+9 more)

### Community 14 - "HostTest.cpp"
Cohesion: 0.21
Nodes (9): cents(), freqOf(), main(), peak(), process(), rmsDb(), Run, out (+1 more)

### Community 15 - "Telemetry"
Cohesion: 0.12
Nodes (16): SbvProcessor::readTelemetry(), Telemetry, airGR, bpm, compGR, deessGR, gr, hasPitch (+8 more)

### Community 16 - "Dsp.h"
Cohesion: 0.14
Nodes (7): charShape(), clampf(), DelayLine, buf, mask, w, softCeil()

### Community 17 - "NoiseGuard"
Cohesion: 0.13
Nodes (15): NoiseGuard, acc, accN, blkLen, cNow, floorDb, hist, hN (+7 more)

### Community 18 - "initEQ"
Cohesion: 0.26
Nodes (14): band(), bindAll(), change(), coerce(), defaultFor(), eqPos(), getPath(), initEQ() (+6 more)

### Community 19 - "toast"
Cohesion: 0.26
Nodes (14): buildRing(), exportWav(), initTransport(), initVA(), pause(), play(), refresh(), setAdv() (+6 more)

### Community 21 - "vaFinish"
Cohesion: 0.27
Nodes (11): analyzeVoice(), audioTick(), demoSuggestions(), genreSugs(), setBand(), showSuggestions(), srcActive(), sug() (+3 more)

### Community 22 - "Biquad"
Cohesion: 0.18
Nodes (8): Biquad, a1, a2, b0, b1, b2, z1, z2

### Community 23 - "compilerOptions"
Cohesion: 0.20
Nodes (9): compilerOptions, jsx, module, moduleResolution, noEmit, skipLibCheck, strict, target (+1 more)

### Community 24 - "serve.cjs"
Cohesion: 0.25
Nodes (4): fs, http, path, types

### Community 25 - "Band"
Cohesion: 0.25
Nodes (8): Band, f, g, q, range, slope, thr, type

### Community 26 - "BandType"
Cohesion: 0.25
Nodes (8): BandType, bBell, bHighpass, bHighshelf, bLowpass, bLowshelf, bNotch, bOff

### Community 28 - "Sacrebleu Voces — compilar e instalar el VST3"
Cohesion: 0.33
Nodes (5): Compilar (después de cambiar la interfaz o el código), Instalar (pide permiso de administrador), Notas, Probar, Sacrebleu Voces — compilar e instalar el VST3

### Community 29 - "Smooth"
Cohesion: 0.33
Nodes (4): Smooth, c, t, v

## Knowledge Gaps
- **314 isolated node(s):** `type`, `f`, `g`, `q`, `slope` (+309 more)
  These have ≤1 connection - possible missing edges or undocumented components. (Counts symbols only; 465 node(s) total have ≤1 connection when file, concept and rationale nodes are included.)
- **3 thin communities (<3 nodes) omitted from report** — run `graphify query` to explore isolated nodes.

## Suggested Questions
_Questions this graph is uniquely positioned to answer:_

- **Why does `SbvProcessor` connect `SbvProcessor` to `Params`, `Tune`, `SbvEditor`, `Compressor`, `PluginProcessor.cpp`, `Denoiser`, `MultiNS`, `Telemetry`, `Dsp.h`, `NoiseGuard`, `.processBlock`, `Biquad`, `String`, `Smooth`?**
  _High betweenness centrality (0.287) - this node is a cross-community bridge._
- **What connects `type`, `f`, `g` to the rest of the system?**
  _314 weakly-connected nodes found - possible documentation gaps or missing edges._
- **Should `SbvProcessor` be split into smaller, more focused modules?**
  _Cohesion score 0.016260162601626018 - nodes in this community are weakly interconnected._
- **Why does `Params` connect `Params` to `SbvProcessor`, `Compressor`, `PluginProcessor.cpp`, `Dsp.h`, `Band`?**
  _High betweenness centrality (0.079) - this node is a cross-community bridge._
- **Should `Root.tsx` be split into smaller, more focused modules?**
  _Cohesion score 0.05093167701863354 - nodes in this community are weakly interconnected._
- **Why does `Tune` connect `Tune` to `Dsp.h`, `SbvProcessor`?**
  _High betweenness centrality (0.069) - this node is a cross-community bridge._
- **Should `Params` be split into smaller, more focused modules?**
  _Cohesion score 0.044444444444444446 - nodes in this community are weakly interconnected._