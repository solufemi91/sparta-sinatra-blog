class BlogController < Sinatra::Base
  # sets root as the parent directory of the current file
  set :root, File.join(File.dirname(__FILE__),"..")

  set :views, Proc.new { File.join(root, "views") }

  configure :development do
    register Sinatra::Reloader
  end

  $posts = [{
	 id: 0,
	 title: "Blogs 1",
	 body: "This is the first post"
},
{
    id: 1,
    title: "Blogs 2",
    body: "This is the second post"
},
{
    id: 2,
    title: "Blogs 3",
    body: "This is the third post"
}];


  get "/" do
    @title = "Main Homepage"
    erb :'blogs/index'
  end

  get "/blogs" do
    @title = "Blog"

    @blogs = $blogs

    erb :'blogs/index'
    "This is the blog index page"
  end

  get "/blogs/new" do
    "New photo form"
  end
  #
  post "/blogs/new" do
    "a new blog was created"
  end
  #
  get "/blogs/:id" do
    id = params[:id].to_i

    @blog = $posts[id]


    erb :'blogs/show'
  end


  #
  get "/blogs/:id/edit" do
    "hello"
  end
  #
  # put "/blogs/:id" do
  #   id = params[:id]
  #   "This is a put #{id}"
  # end
  #
  # delete "/blogs/:id" do
  #
  #   id = params[:id]
  #   "delete a specific photo #{id}"
  # end

end
