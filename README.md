# APIs for Social Scientists: A collaborative review
This repository contains the code underlying a review of APIs that can be useful to social scientists. Thereby it provides explanations, code examples and research examples.

You can find the document here: [APIs for social scientists:
A collaborative review](https://bookdown.org/paul/apis_for_social_scientists/). The introduction explains how this project came about.

## Current authors & contributors
Paul C. Bauer (current Editor), Jan Behnert, Lion Behrens (current Editor), Chung-hong Chan, Bernhard Clemm von Hohenberg, Lukas Isermann, Philipp Kadel, Melike N. Kaplan, Jana Klein, Markus Konrad, Barbara K. Kreis, Camille Landesvatter (current Editor), Madleen Meier-Barthold, Ondrej Pekacek, Pirmin Stöckle, Dean Lajic


### Why contribute?
* You can learn about an API by writing about it :bulb:
* You can help others to dive more quickly and more easily into the world of APIs.
* Your name will appear as one of the contributors and as the main author for the corresponding chapter.
* How will we keep the reviews up to date?
    + Descriptions of and code examples for APIs are only useful when they are up to date. Our plan is to update chapters that are outdated, e.g., if an API version changes. Sometimes this might require adding new authors/contributors to a chapter if the original authors become inactive.


### How to contribute?
* Provide feedback and let us know where you got stuck
* Highlight or correct errors by raising [issues](https://github.com/paulcbauer/apis_for_social_scientists_a_review/issues) or by creating pull requests
* Write another review chapter of an API. To so please read the instructions in the section [Contributing a chapter](https://github.com/paulcbauer/apis_for_social_scientists_a_review#contributing-a-chapter) below and take one of the existing chapter as an example.


### Contributing a chapter
We are following a five-step process where you contact us to propose a chapter that introduces a particular API (**Step 1**), submit the chapter to us via email (**Step 2**), work any feedback into the chapter (**Step 3**), clone the repository, compile the website/book locally and add your chapter locally (on your computer) (**Step 4**), and create a pull-request to submit it to our repository online (**Step 5**). We can help you with this last step.

* **Step 1**: Send us an email (apireviews@googlegroups.com) if you want to suggest adding a chapter on a particular API.
* **Step 2**: Submit chapter per email (zipped with all the files) that we can compile locally
    + **Structure**: Your chapter should follow the structure of the other chapters and include the same headlines/questions.
        + Provided services/data: Brief description of the API and its features. 
        + Prerequisites: What are the prerequisites to access the API (e.g., authentication)?
        + Simple API call: What does a simple API call look like?
        + API access in R: How can we access the API from R (httr + other packages)?
        + Social science examples: Are there social science research examples using the API?
    + **Format**: We kindly ask you to provide your chapter as a R markdown file. Ideally, you simply copy the .rmd file from another chapter from the repository to adapt the structure, length and code examples (remember to be as simple as possible to get people started). For instance, you can take "Chapter_Twitter_api.Rmd" as an example.
    + **File and chunk names**: Please name your own .rmd file in the following format: “99-xxx.Rmd", e.g "99-facebook-ads-library.Rmd". Also, all the chunks in your chapter should be named and numbered according to the chapter name, e.g., “facebook-ads-1”, “facebook-ads-2” etc.
    + **API key & data**: Please use "your-api-key"" as a placeholder for your API key and store the key as an environmental variable as described in best practices chapter (under no circumstances upload the key to the public repository). The corresponding code chunk should be set to eval=FALSE and the actual api call should only be executed locally. The data that you get through the API, should be saved as an .RDS file and be loaded using readRDS() in a chunk that is set to echo=FALSE so that it’s not visible. See the R chunk "twitter-3" in Chapter_Twitter_api.Rmd as an example.
    + **Citations**: Please make sure that you cited properly and provide the citations in the bibtex format. You have to acknowledge all the material you draw on in your chapter (also blog posts etc). Please provide a file called “references.bib” that includes your citations (in case you push directly into our repo you can add the citations in the corresponding file). 
    + Further points: Make sure to send us a zip-folder that includes all the files we need to compile your chapter locally (e.g., .RDS files). RDS files should be stored in a subfolder called “data”.
* **Step 3**: After receiving your chapter we will compile it locally and provide you with feedback
* **Step 4**: Clone the repository https://github.com/paulcbauer/apis_for_social_scientists_a_review, compile the website/book locally (you will need a few packages such as the bookdown package). Then copy your chapter into the folder and compile the website/book locally again. Once you able to compile the website/book locally with your chapter move to **Step 4**.
* **Step 5**: Create a pull-request to submit it to our repository online. Directly contributing to the repository makes it transparent who and how much everyone contributed.


### New & incoming chapters
* See corresponding [issue](https://github.com/paulcbauer/apis_for_social_scientists_a_review/issues/13) for an overview of new and incoming chapters.


## Useful links
* A long list of public APIs: https://github.com/public-apis/public-apis
