const request = require('supertest');
const app = require('./index');

describe('Application Tests', () => {
    test('GET / should return correct message', async () => {
        const response = await request(app).get('/');
        expect(response.statusCode).toBe(200);
        expect(response.text).toBe('DevSecOps Workshop Working!');
    });
});
