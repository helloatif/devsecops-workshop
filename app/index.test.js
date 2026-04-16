const request = require('supertest');
const app = require('./index');

describe('Application Tests', () => {
    test('GET / should return correct message', async () => {
        const response = await request(app).get('/');
        expect(response.statusCode).toBe(200);
        expect(response.text).toBe('DevSecOps Workshop Working!');
    });

    test('GET /api/health should return OK status', async () => {
        const response = await request(app).get('/api/health');
        expect(response.statusCode).toBe(200);
        expect(response.body.status).toBe('OK');
        expect(response.body).toHaveProperty('timestamp');
    });

    test('GET /api/users should return users array', async () => {
        const response = await request(app).get('/api/users');
        expect(response.statusCode).toBe(200);
        expect(Array.isArray(response.body)).toBe(true);
        expect(response.body.length).toBeGreaterThan(0);
        expect(response.body[0]).toHaveProperty('name');
    });
});