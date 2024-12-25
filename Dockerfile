# Gunakan image Node.js sebagai basis
FROM node:18-alpine

# Set working directory ke /app
WORKDIR /app

# Copy package*.json ke dalam container
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy kode aplikasi ke dalam container
COPY . .

# Expose port 3000 untuk akses dari luar
EXPOSE 3000

# Jalankan perintah npm start ketika container dijalankan
CMD ["npm", "run", "dev", "--", "--port", "3000"]