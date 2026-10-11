FROM node:20-slim

# Create app directory
WORKDIR /app

# Install dependencies deterministically using the lockfile
COPY package.json package-lock.json ./
RUN npm ci --omit=dev && chown -R node:node /app

# Copy app source as non-root user
COPY --chown=node:node . .

ENV NODE_ENV=production
ENV PORT=8000

EXPOSE 8000

# Run as non-root user provided by the image
USER node

CMD ["npm", "start"]
