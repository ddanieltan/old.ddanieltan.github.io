---
title : "How to create this blog (Part 1)"
tags : "drafts"
---

# How to create this blog (Part 1)
In Part 1 of this How-to, I cover the core tools I used to create this blog. These tools are primarily from [The Executable Books Project (EBP)](https://executablebooks.org/en/latest/) and [Sphinx](https://www.sphinx-doc.org/en/master/usage/quickstart.html).

In Part 2, I will cover how to deploy the blog on a custom domain.

## The Executable Books Project (EBP)
```{image} /images/2020/executable_books_project.png
:target: https://executablebooks.org/en/latest/
:align: center
```
I'll never forget the 1st time I saw a lesson taught using a Jupyter notebook, where a narrative describing the problem and executable code demonstrating a solution were put side by side. It was my 1st exposure to this approach of melding code and writing together which I later learnt is referred to as a **computational narrative**.

The EBP is an international collaboration between several universities to build open source tools that facilitate publishing computational narratives using the Jupyter ecosystem. Using the tools within EBP, I am able to write my content for this blog either as a markdown file or as a Jupyter notebook. Of course, the tools are applicable to much more than just simple blogging use cases, and their documentation is excellent so I encourage you to read more about this project directly over on their [page](https://executablebooks.org/en/latest/).

## Sphinx
Sphinx is a Python-based documentation generation tool that efficiently indexes and keeps track of content files. Amongst Sphinx's many extensions is one called [Ablog](https://ablog.readthedocs.io/). Ablog uses Sphinx as an engine to convert my content files into html/css files that make up this site.

```{admonition} Also consider - [Fastpages](https://github.com/fastai/fastpages)
:class: tip
Fastpages is another notebook-focused blogging library coming from the excellent fastai family. 
The only reason why I decided to not go with this option was that I had a preference of using Sphinx(Python) over Jekyll(Ruby). I've read in the [fastai forums](https://forums.fast.ai/t/fastpages-github-pages-blog-using-nbdev/62828/273) that a new version powered by Hugo is planned, and would be very interested to try that once it's out!
```

## My reason for choosing to use these tools

I am familiar with Jupyter and Sphinx because I use these tools at work
: My goal for blogging is to practise my writing. As I grow in my career both as a Data Scientist and teacher, it's more apparent to me that being able to communicate with clarity is such an important skill to hone. Therefore, while I love to learn new technologies, I'm going to stick with familiar tools so I can get this blog up and running and focus on the writing.

Jupyter notebooks are 1st class citizens
: Jupyter notebooks are notoriously finicky to convert into html/css. The tools from EBP essentially take away a lot of the usual friction you would encounter and make it easy to include other features such as 

I like the aesthetics of the [theme](https://pydata-sphinx-theme.readthedocs.io/en/latest/index.html)
: If, like me, you spend a lot of time reading the [pandas documentation](https://pandas.pydata.org/docs/), you probably would find the look and feel of this blog comfortingly familiar. That's because the blog is using the exact same theme! After hours of reading the pandas documentation, I've grown to like the design choices of this theme, and applying it to my blog was a no-brainer.

I was inspired by [Chris Holdgraf's blog](https://predictablynoisy.com/posts/2020/sphinx-blogging/)
: Chris is one the core members in EBP. His blog and it's open sourced code was my starting point. It made it simple enough for me to get something working and I went on to make some small modifications from there.


## Starter Template
This is a link to a starter template for this blog.
[My blog starter template]() : A starter repository you can clone and start using immediately.
```
Insert tree
```
- Clone this repository and install the dependencies listed in `requirements.txt`
- Write a post using either a markdown or jupyter notebook. By default, you should place that content file in the `posts/` directory (this is configurable in `conf.py`)
- To build your site, in the root directory run the command `make html`
- The make command will build a `_build/` directory and the html files that will make up your site will be in `_build/html/`
- Open up `index.html` in a browser and you can view your site locally
- Easily deploy the site online using [Github Pages](https://pages.github.com/)

## How I write my posts

In a terminal window, run `python auto_reload.py`
: Firstly, I run a simple script that uses the [livereload](https://github.com/lepture/python-livereload) library to automatically rebuild my site everytime it detects changes in my blog repository. Then I open a browser window and point it to `localhost:5500` to see my changes to my posts in real time.

Open `jupyter lab`, create a markdown or ipynb file under posts/**
: Next, I run jupyter lab as my main editor to write a new post. You can opt to use any other editor/IDE to create a markdown or iPython notebook file but I choose to use jupyter lab to easily edit notebook level and/or cell level metadata.

Regardless if you use a markdown of Jupyter notebook, ensure minimally you have filled in `date` and `title` metadata in the document. Posts without dates are treated as Drafts and won't be published in your regular blog roll. More details on this in the [Ablog documentation](https://ablog.readthedocs.io/manual/posting-and-listing/).

````{tabbed} Example blogpost.md
```
---
date : 2020-01-01
title : "Example blog title"
---
Lorem ipsum dolor sit amet, consectetur adipiscing elit
sed do eiusmod tempor incididunt ut labore et dolore magna
Ut enim ad minim veniam, quis nostrud exercitation ullamco
nisi ut aliquip ex ea commodo consequat. Duis aute irure
```
````

````{tabbed} Example blogpost.ipynb
```{image} /images/2020/ipynb_metadata.png
:align: center
```
````

## Miscellaneous details

When I was building this blog, I ran into areas I did not find entirely straightforward. Here are some notes I wrote that might help you if you run into any roadblocks.

### conf.py

`conf.py` is the main configuration file for the entire project and it contains a lot of settings. My advice is to really experiment and play around with all these settings to understand the extent of how to make this blog your own.

When it comes to exploring the full list of configurable options we will hit 1 of the downsides of my approach to creating a blog. As we are are using separate libraries, we don't have a single centralized place that records all the configurable options in this project. So for any existing of new configuration you want to implement, you will need to spend some time exploring the following resoures:
- [Sphinx documentation](https://www.sphinx-doc.org/en/master/usage/configuration.html) 
- [Ablog documentation](https://ablog.readthedocs.io/)
- [Pydata Theme documentation](https://pydata-sphinx-theme.readthedocs.io/en/latest/index.html)
- [MyST parser documentation](https://myst-parser.readthedocs.io/en/latest/using/intro.html)

### index.md
Every html output page has an equivalent markdown/Jupyter notebook page. Most pages are rather self explanatory, for example you can compare the output of 

The order of the pages in the topbar of the site inherits from the `toctree`. This is what it looks like 

### Customizing html and css
There were some customizations I wanted to make to my site that did not have a `conf.py` API. 

For example, by default, "Build with Sphinx \<version>" is written in every `footer.html`. While I definitely wanted to attribute my blog to Sphinx, but equally, I wanted to attribute the tools from EBP. As I could not find a way to configure my footer message in `conf.py`, my eventual solution was simply to overwrite the `footer.html` in `_templates/` with the message you currently see.

`footer.html` is written in the [Jinja templating language](https://jinja.palletsprojects.com/en/2.11.x/), which means you can probably elegantly use the `{extends}` pattern to append added code. However, as I'm honestly quite new to front end coding, I just overwrote the entire file using code taken from its [source](https://github.com/pandas-dev/pydata-sphinx-theme/blob/master/pydata_sphinx_theme/footer.html).

Similarly, any custom css, for example the [waving hand animation](https://jarv.is/notes/css-waving-hand-emoji/) in my About me page, is added to `_static/custom.css`. 

All custom themes and css are written last during each build, ensuring those settings overwrite the defaults.
