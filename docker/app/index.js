const ronin = require('ronin-server')
const mocks = require('ronin-mocks')

const server = ronin.server()


server.use('/', mocks.server(server.Router(), false, true))
server.listen(3301, ()=>{
    console.log('🚀 Server ready at: http://localhost:3301/')
})