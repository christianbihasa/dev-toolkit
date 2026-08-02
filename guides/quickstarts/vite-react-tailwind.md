# Quickstart: Vite + React (TS) + Tailwind CSS v4

### 1. Scaffold Vite React Project
```bash
npm create vite@latest my-app -- --template react-ts
cd my-app
npm install
```

### 2. Install Tailwind CSS v4 & Icons
```bash
npm install tailwindcss @tailwindcss/vite lucide-react react-router-dom
```

### 3. Configure `vite.config.ts`
Add the Tailwind plugin:
```typescript
import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'
import tailwindcss from '@tailwindcss/vite'

export default defineConfig({
  plugins: [react(), tailwindcss()],
})
```

### 4. Update CSS Entrypoint (`src/index.css`)
Replace contents with the single v4 import:
```css
@import "tailwindcss";
```

### 5. Launch
```bash
npm run dev
```