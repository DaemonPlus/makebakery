TITLE(`Makefile-Based Static Website Generator')
DATE(`Thu, 28 Feb 2013 18:27:11 -0500')

<p><img style="margin: 10px 5% 10px 5%; max-width: 40%;" class="pull-right" src="http://lorempixel.com/400/400/cats/Placeholder%20Image/" /><b>makebakery</b> is a <i>Makefile</i> that builds a static website from various sources, using the venerable old UNIX tool <tt><a href="https://www.gnu.org/software/make/">GNU make</a></tt>. It is carefully crafted to be modular and extensible, allowing it to be customized to your preferences.</p>

<p>A <i>static</i> website is one which requires no special logic on the server-side to work, as opposed to <i>dynamic</i> websites which trigger some server-side processing for most page requests. Static websites are useful because they're effortlessly fast, scalable, and cache-able. Compared to dynamic sites, static sites are much easier to secure, and can be served from the very cheapest of hosting services.</p>

<p>This technique of generating static websites <a href="examples/whats-in-a-name/index.html">has been called <i>baking</i></a>, as opposed to <i>frying</i> up a new page upon each request.</p>

<p><tt>GNU Make</tt> is a tool that figures out which commands need to be run to transform some given set of source files into a desired set of output files.
Originally created for compilation of source code into executable code, Makebakery uses GNU Make to transform files in various source formats like Markdown into an HTML website.
Modern work-alikes include <a href="gruntjs.com">Grunt</a>, <a href="http://rake.rubyforge.org">Rake</a>, or <a href="http://ant.apache.org">Ant</a>.
Despite its age and the number of times it has been re-invented, <tt>GNU Make</tt> has some surprising features that I think makes it superior to the newcomers:</p>

<ul>
<li>When invoked multiple times, it is smart enough to only recompile target files whose source files have changed.</li>
<li>When used on multi-core systems or with I/O heavy jobs, it is smart enough to figure out how to parallelize its work.</li>
<li>Make can apply multiple compilation steps to each source file to render the desired output, and it cleans up the intermediate files automatically.</li>
</ul>

<p><tt>Make</tt> has a rather steep learning curve, but since it is so ubiquitous, it's likely to be already installed on your computer, and your web host's servers, and easy to obtain if not.</p>

<p>I show in the demonstration site source code how one might wire up their favorite plaintext-to-html compiler to Makebakery. I recommend <a href="http://johnmacfarlane.net/pandoc/">Pandoc</a>, which lets you can keep all your source files in markdown format. You might also add a templating engine like <a href="http://jinja.pocoo.org/">Jinja</a>, or CSS compilers like <a href="http://lesscss.org/">LESS</a>, image processing using <a href="http://www.imagemagick.org">ImageMagick</a>, and any other custom scripts you please to the compilation pipeline.</p>

<p>This website is the result of running <code>make</code> in the <code>makebakery</code> source code, which compiles the included demo site source in <code>/demo-src</code> to HTML.
Visit <a href="https://github.com/datagrok/makebakery">the makebakery project page on GitHub</a> to learn more.</p>

<p>More about Make and GNU Make: <a href="https://en.wikipedia.org/wiki/Make_%28software%29">Wikipedia: Make (software)</a></p>

<h2>Interesting features</h2>

<p>Static page-compiling tools are fairly boring, but there are some clever pieces within makebakery:</p>

<ul>
<li>Unlike many other static-site-building projects, makebakery tries to remain language-agnostic. </li>
<li>Pages are compiled in a pipeline according to their filename extension. You may freely mix markdown, raw html, compile-time executables, and other files within your sources. Also, you may chain them together, so that for example a python script might retrieve information from a database and render markdown, which is then rendered into html.</li>
<li><code>demo-src/pages.json.m4.index</code> renders <a href="pages.json">a .json index of all the pages on the site</a>. This enables us to automatically build navigation bars like the one in the header on this page, or "recent changes" links, all on the client side. Take careful note of this: the site is static but the header bar will <i>automatically be updated whenever pages are added or removed</i>.
<li><code>demo-src/atom.xml.m4.index</code> renders <a href="atom.xml">an atom-format .xml file</a> of changes made to the site. Even though the site is static you can still have it update feed readers whenever you make a change.
<li><tt>GNU make</tt> has built-in support for multiprocessing. With one command-line option it will take full advantage of multi-core and multi-processor machines to compile pages in parallel.
<li>I have recently implemented most features as a system of <tt>GNU Make</tt>-based <i>plug-ins</i> around a small core Makefile. Easily toggle between the features you prefer, disable the ones you don't use to save speed, or build your own without having to modify the entire system.</li>
</ul>

<h2>Using GNU M4 as a templating language</h2>

<p>When I first started this project, it was named <i>m4-bakery</i>, and the focus was on a single templating mechanism using another ubiquitous old unix tool: GNU M4. However, the learning curve for <tt>m4</tt> is very steep and the resulting code can be quite ugly, especially for nontrivial tasks. <tt>m4</tt> has now been relegated to a mere makebakery plug-in that I include simply because I once enjoyed the challenge of using it.</p>

<p>Using <tt>m4</tt> as a templating engine brought along some interesting challenges of its own:</p>
<ul>
<li>Unlike many other templating schemes, I try to avoid any boilerplate in source files. Page templates are not "included" from sources; instead all sources get a template wrapped around them. This was somewhat tricky to accomplish with <tt>m4</tt>.</li>
</ul>

<h2>Coming soon</h2>

<ul>
<li>Example of how to automatically build a blog from a collection of posts, with RSS and ATOM feeds.</li>
<li>Example of how to automatically build a breadcrumbs bar.</li>
<li>Example of how to automatically build a <a href="http://www.sitemaps.org">sitemap</a>.</li>
<li>Example of how to automatically compile Twitter Bootstrap CSS from its LESS or SASS sources.</li>
<li>Example of a static AJAX-based application, its static backend, and the <a href="https://developers.google.com/webmasters/ajax-crawling/docs/learn-more">HTML Snapshot needed for non-JavaScript browsers and web-crawlers to index it</a>.
<li>Example of using <tt>phpcli</tt> to make a typical PHP-format dynamic site static.</li>
</ul>

<p>Created by <a href="http://datagrok.org">Michael F. Lamb</a>. License: <a href="https://www.gnu.org/licenses/agpl-3.0.html">GNU Affero GPL version 3 or later</a>, with additional permissions for unencumbered output. See the <a href="https://github.com/datagrok/makebakery/blob/master/COPYING.md">COPYING</a> in the source code for more information.</p>
