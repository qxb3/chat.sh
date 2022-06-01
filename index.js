const express = require('express')
const app = express()
app.use(express.text())

const messages = []

app.post('/send', (req, res) => {
  messages.push(req.body)

  res.json({
    status: 200,
    message: 'Message successfully sent'
  })
})

app.get('/fetch', (_, res) => {
  res.send(messages.join('\n'))
})

app.listen(8080, () => {
  console.log('Running on http://localhost:8080')
})
