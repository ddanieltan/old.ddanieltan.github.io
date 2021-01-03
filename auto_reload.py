from livereload import Server, shell
server = Server()
server.watch('posts/', shell('make dirhtml'))
server.serve(root='_build/dirhtml')
