const express = require('express');
const axios = require('axios');

const router = express.Router();

module.exports = (params) => {
  const { apiUrl } = params;

  router.get('/', async (req, res, next) => {
    try {
      return res.json({
        version: process.env.VERSION,
        apiUrl: process.env.API_URL,
        apiService: process.env.API_SERVICE,
        datastore: process.env.DATASTORE,
        configurationService: process.env.CONFIGURATION_SERVICE,
      });
    } catch (err) {
      return next(err);
    }
  });

  router.all('*', async (req, res, next) => {
    try {
      let method = req.method;
      let url = `${apiUrl}${req.url.replace('/api', '')}`;
      let data = req.params;
      console.log("/api ", method, url, data);
      const result = await axios({ method, url, data });
      return res.json(result);
    } catch (err) {
      return next(err);
    }
  });

  return router;
};
