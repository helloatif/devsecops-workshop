const express = require('express');
const helmet = require('helmet');
const cors = require('cors');
const morgan = require('morgan');

const app = express();

// Security middleware
app.use(helmet());
app.use(cors());
app.use(morgan('combined'));
app.use(express.json());
app.use(express.static('public')); // For serving HTML dashboard

// Health check endpoint
app.get('/api/health', (req, res) => {
    res.json({ 
        status: 'OK', 
        timestamp: new Date().toISOString(),
        uptime: process.uptime()
    });
});

// Users endpoint
app.get('/api/users', (req, res) => {
    res.json([
        { id: 1, name: 'John Doe', email: 'john@example.com' },
        { id: 2, name: 'Jane Smith', email: 'jane@example.com' },
        { id: 3, name: 'Alice Johnson', email: 'alice@example.com' }
    ]);
});

// Dashboard page route
app.get('/dashboard', (req, res) => {
    res.sendFile('dashboard.html', { root: './public' });
});

// Main endpoint
app.get('/', (req, res) => {
    res.send('DevSecOps Workshop Working!');
});

// Export for testing
module.exports = app;

// Only start server if run directly
if (require.main === module) {
    const PORT = 3000;
    app.listen(PORT, () => {
        console.log(`🔒 Secure server running on port ${PORT}`);
        console.log(`📊 Health check: http://localhost:${PORT}/api/health`);
        console.log(`👥 Users API: http://localhost:${PORT}/api/users`);
        console.log(`🎨 Dashboard: http://localhost:${PORT}/dashboard`);
    });
}