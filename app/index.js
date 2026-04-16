const express = require('express');
const app = express();

app.get('/', (req, res) => {
    res.send('DevSecOps Workshop Working!');
});

module.exports = app;

if (require.main === module) {
    const PORT = 3000;
    app.listen(PORT, () => {
        console.log(`Running on port ${PORT}`);
    });
}