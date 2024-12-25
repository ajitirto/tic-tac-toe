import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'

// https://vite.dev/config/
export default defineConfig({
  server: {
    port: 3000, // Set port ke 3000
    host: true, // Agar bisa diakses dari jaringan
  },
  plugins: [react()],
})
