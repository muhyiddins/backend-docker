module.exports = [{
    script: 'backend/index.js',
    name: 'backend-docker',
    exec_mode: 'cluster',
    instances: 4,
    node_args: "--max_old_space_size=8192"
  }]
  