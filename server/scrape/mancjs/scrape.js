var fs        = require('fs');
var cheerio   = require('cheerio');
var request   = require('request');
var SysLogger = require('ain2');
var logger    = new SysLogger({tag: 'scrapeMancjs', facility: 'local5' });
var Mailgun   = require('mailgun-js');

var url         = 'http://www.mancjs.com';
var mancjsCount = fs.readFileSync('/home/greg/scrape/mancjs/mancjsCount', 'utf8');
var api_key     = "MYKEY";
var domain      = "mail.gregjs.com";
var from_who    = "scraped@gregjs.com";

// mail setup
var sendMail = function(subject, html) {
  var mailgun = new Mailgun({apiKey: api_key, domain: domain});

  var mail = {
    from: from_who,
    to: "MY_EMAIL",
    subject: subject,
    html: html
  };

  mailgun.messages().send(mail, function(err, body) {
    if (err) {
      logger.error('ERROR: ' + err);
    }
    else {
      logger.info('Message sent: ', body);
    }
  });
};

// turn the permalink into a full link so it can be clicked in the e-mail
var changePermalink = function(html) {
  var $        = cheerio.load(html);
  var permHref = $('a').last().attr('href');

  $('a').last().attr('href', url + permHref);

  return $.html();
};

// main request and scrape function
request(url, function(err, res, data) {
  if (err) {
    logger.error('ERROR: ' + err);
  }
  else {
    var $ = cheerio.load(data);

    // contains all events
    var events = $('.span7').find('.box');
    var subject, html;

    if (events.length > Number(mancjsCount)) {
      subject = events.children().first().text().trim();
      html    = events.children().first().next().html();
      html    = changePermalink(html);

      // send the mail
      sendMail(subject, html);

      // update the file with the new event count for future comparison
      fs.writeFileSync('/home/greg/scrape/mancjs/mancjsCount', events.length + '\n');
    }
    else {
      logger.info('No new meetups');
    }
  }
});
