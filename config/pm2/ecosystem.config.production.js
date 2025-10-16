module.exports = {
  apps: [
    {
      name: 'acp-backend',
      cwd: '../../backend',
      script: 'node',
      args: 'dist/main.js',
      instances: 'max',
      exec_mode: 'cluster',
      env: {
        NODE_ENV: 'production',
        BACKEND_PORT: 3001,
      },
    },
  ],
};
