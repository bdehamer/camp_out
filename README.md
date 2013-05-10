# CampOut

[![Build Status](https://secure.travis-ci.org/bdehamer/camp_out.png?branch=master)](http://travis-ci.org/bdehamer/camp_out)


Ruby wrapper for the [Active.com Campground API](http://developer.active.com/docs/read/Campground_APIs). 

## Prerequisites

In order to access the Active.com Campground API you need to register for a
developer account and apply for an API key.

Use the [account registration page](http://developer.active.com/member/register) to
sign-up for an account and then visit the [API keys page](http://developer.active.com/apps/mykeys) to request a key for the Campground API.

## Installation

Install the gem:

    [sudo] gem install camp_out

Then, in your application or script:

    require 'camp_out'

## Usage

    client = CampOut.new(api_key: 'a1b2c3x4y5z6')
    client.list_campgrounds(pstate: 'CA')

or 

    CampOut.configure do |config|
      config.api_key = 'a1b2c3x4y5z6'
    end

    client = CampOut.new
    client.list_campgrounds(pstate: 'CA')
