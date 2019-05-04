# docker-hackmyresume <!-- omit in toc -->

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
![Docker Build Status](https://img.shields.io/docker/build/kir4h/hackmyresume.svg)
![Docker Pulls](https://img.shields.io/docker/pulls/kir4h/hackmyresume.svg)

- [Summary](#summary)
- [Motivation](#motivation)
- [Acknowledgements](#acknowledgements)
- [Building the image](#building-the-image)
- [Using the image](#using-the-image)
- [Known issues](#known-issues)

## Summary

Docker image that allows you to generate multiple output formats using
[hackmyresume](https://github.com/hacksalot/HackMyResume).

Highlights:

- Based on alpine
- qt patched version of [wkhtmltopdf](https://wkhtmltopdf.org/) is installed for exporting to `PDF`
- Base image with wkhtmltopdf and hackmyresume
- Is used as base by [hackmyresume-all-themes](https://github.com/kir4h/docker-hackmyresume-all-themes) image that adds
- some preinstalled [JSON Resume](https://jsonresume.org/) themes on top

## Motivation

I was exploring Hackmyresume as a tool for generating my resume and wanted a docker image that would take my resume and
generate an exported version. There are different docker images in docker Hub that contain hackmyresume but I didn't
found an image that would fullfill all of my requirements:

- Based on Alpine for size reduction
- Containing a qt patched version of wkhtmltopdf
- Having preinstalled themes into the image
- Having pinned version of main components for consistency
- Using a multistage build for the patched wkthmltopdf version

## Acknowledgements

[aantonw](https://github.com/aantonw), whose image is used to fetch the patched wkhtmltopdf binaries

## Building the image

There is nothing special regarding the build procedure, just run docker build:

```bash
docker build -t kir4h/hackmyresume .
```

or use the Makefile

```bash
make build
```

## Using the image

The usage is the same as for `hackmyresume-all-themes` image except for the fact that there are no preinstalled JSON
resume themes. [fresh](https://github.com/fresh-standard/fresh-resume-schema) themes are though already available out of
the box with hackmyresume

In order to have persistent JSON resume themes one can:

- Create his own docker image from this one, adding the desired theme(s)
- Use a named volume mounted on `/usr/lib/node_modules/` so that themes are persisted. A bind mount should also work but
as it would shadow the base image folder hackmyresume would need to be reinstalled

## Known issues

I have observed issues for some of the themes:

- in some cases the html version looks fine but pdf doesn't
- in some cases the pdf version looks fine but html doesn't
- for some themes the profile picture is ignored

Since this is an old project and themes are also old, I guess there are some incompatibilities with themes and versions,
or even maybe with wkhtmltopdf. If this is something that can be fixed from this Docker image I am more than happy to
accept PRs.
