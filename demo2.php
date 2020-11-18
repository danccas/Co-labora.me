<?php
require_once('conf.php');

require_once(LIBRARYS . 'dist/Google/Client.php');
require_once(LIBRARYS . 'dist/Google/Service.php');
require_once(LIBRARYS . 'dist/Google/Service/Resource.php');
require_once(LIBRARYS . 'dist/Google/Service/YouTube/Resource/Comments.php');
require_once(LIBRARYS . 'dist/Google/Service/YouTube/Resource/CommentThreads.php');
require_once(LIBRARYS . 'dist/Google/Service/YouTube/Resource/Activities.php');
require_once(LIBRARYS . 'dist/Google/Service/YouTube/Resource/Captions.php');
require_once(LIBRARYS . 'dist/Google/Service/YouTube/Resource/Channels.php');
require_once(LIBRARYS . 'dist/Google/Service/YouTube/Resource/ChannelBanners.php');
require_once(LIBRARYS . 'dist/Google/Service/YouTube/Resource/ChannelSections.php');
require_once(LIBRARYS . 'dist/Google/Service/YouTube/Resource/GuideCategories.php');
require_once(LIBRARYS . 'dist/Google/Service/YouTube/Resource/I18nLanguages.php');
require_once(LIBRARYS . 'dist/Google/Service/YouTube/Resource/I18nRegions.php');
require_once(LIBRARYS . 'dist/Google/Service/YouTube/Resource/LiveBroadcasts.php');
require_once(LIBRARYS . 'dist/Google/Service/YouTube/Resource/LiveChatBans.php');
require_once(LIBRARYS . 'dist/Google/Service/YouTube/Resource/LiveChatMessages.php');
require_once(LIBRARYS . 'dist/Google/Service/YouTube/Resource/LiveChatModerators.php');
require_once(LIBRARYS . 'dist/Google/Service/YouTube/Resource/LiveStreams.php');
require_once(LIBRARYS . 'dist/Google/Service/YouTube/Resource/Members.php');
require_once(LIBRARYS . 'dist/Google/Service/YouTube/Resource/MembershipsLevels.php');
require_once(LIBRARYS . 'dist/Google/Service/YouTube/Resource/PlaylistItems.php');
require_once(LIBRARYS . 'dist/Google/Service/YouTube/Resource/Playlists.php');

require_once(LIBRARYS . 'dist/Google/Service/YouTube/Resource/Search.php');
require_once(LIBRARYS . 'dist/Google/Service/YouTube/Resource/Sponsors.php');
require_once(LIBRARYS . 'dist/Google/Service/YouTube/Resource/Subscriptions.php');
require_once(LIBRARYS . 'dist/Google/Service/YouTube/Resource/SuperChatEvents.php');
require_once(LIBRARYS . 'dist/Google/Service/YouTube/Resource/Thumbnails.php');
require_once(LIBRARYS . 'dist/Google/Service/YouTube/Resource/VideoAbuseReportReasons.php');
require_once(LIBRARYS . 'dist/Google/Service/YouTube/Resource/VideoCategories.php');
require_once(LIBRARYS . 'dist/Google/Service/YouTube/Resource/Videos.php');
require_once(LIBRARYS . 'dist/Google/Service/YouTube/Resource/Watermarks.php');
require_once(LIBRARYS . 'dist/Google/Auth/FetchAuthTokenInterface.php');
require_once(LIBRARYS . 'dist/Google/Auth/OAuth2.php');





require_once(LIBRARYS . 'dist/Google/Service/YouTube.php');


#require_once(LIBRARYS . 'dist/Google/Service/YouTube/LiveBroadcast.php');

session_start();

/*
 * You can acquire an OAuth 2.0 client ID and client secret from the
 * {{ Google Cloud Console }} <{{ https://cloud.google.com/console }}>
 * For more information about using OAuth 2.0 to access Google APIs, please see:
 * <https://developers.google.com/youtube/v3/guides/authentication>
 * Please ensure that you have enabled the YouTube Data API for your project.
 */
$OAUTH2_CLIENT_ID = '898900095103-3uevkhfv5u6vvf1fvcup0e95v1cqqdj9.apps.googleusercontent.com';
$OAUTH2_CLIENT_SECRET = 'EnwrtSyNAMGT3xECKmop1B9g';

$client = new Google_Client();
$client->setClientId($OAUTH2_CLIENT_ID);
$client->setClientSecret($OAUTH2_CLIENT_SECRET);
$client->setScopes('https://www.googleapis.com/auth/youtube');
$redirect = filter_var('http://' . $_SERVER['HTTP_HOST'] . $_SERVER['PHP_SELF'],
    FILTER_SANITIZE_URL);
$client->setRedirectUri($redirect);

// Define an object that will be used to make all API requests.
$youtube = new Google_Service_YouTube($client);

// Check if an auth token exists for the required scopes
$tokenSessionKey = 'token-' . $client->prepareScopes();
if (isset($_GET['code'])) {
  if (strval($_SESSION['state']) !== strval($_GET['state'])) {
    die('The session state did not match.');
  }

  $client->authenticate($_GET['code']);
  $_SESSION[$tokenSessionKey] = $client->getAccessToken();
  header('Location: ' . $redirect);
}

if (isset($_SESSION[$tokenSessionKey])) {
  $client->setAccessToken($_SESSION[$tokenSessionKey]);
}

// Check to ensure that the access token was successfully acquired.
if ($client->getAccessToken()) {
  try {
    // Create an object for the liveBroadcast resource's snippet. Specify values
    // for the snippet's title, scheduled start time, and scheduled end time.
    $broadcastSnippet = new Google_Service_YouTube_LiveBroadcastSnippet();
    $broadcastSnippet->setTitle('New Broadcast');
    $broadcastSnippet->setScheduledStartTime('2034-01-30T00:00:00.000Z');
    $broadcastSnippet->setScheduledEndTime('2034-01-31T00:00:00.000Z');

    // Create an object for the liveBroadcast resource's status, and set the
    // broadcast's status to "private".
    $status = new Google_Service_YouTube_LiveBroadcastStatus();
    $status->setPrivacyStatus('private');

    // Create the API request that inserts the liveBroadcast resource.
    $broadcastInsert = new Google_Service_YouTube_LiveBroadcast();
    $broadcastInsert->setSnippet($broadcastSnippet);
    $broadcastInsert->setStatus($status);
    $broadcastInsert->setKind('youtube#liveBroadcast');

    // Execute the request and return an object that contains information
    // about the new broadcast.
    $broadcastsResponse = $youtube->liveBroadcasts->insert('snippet,status',
        $broadcastInsert, array());

    // Create an object for the liveStream resource's snippet. Specify a value
    // for the snippet's title.
    $streamSnippet = new Google_Service_YouTube_LiveStreamSnippet();
    $streamSnippet->setTitle('New Stream');

    // Create an object for content distribution network details for the live
    // stream and specify the stream's format and ingestion type.
    $cdn = new Google_Service_YouTube_CdnSettings();
    $cdn->setFormat("1080p");
    $cdn->setIngestionType('rtmp');

    // Create the API request that inserts the liveStream resource.
    $streamInsert = new Google_Service_YouTube_LiveStream();
    $streamInsert->setSnippet($streamSnippet);
    $streamInsert->setCdn($cdn);
    $streamInsert->setKind('youtube#liveStream');

    // Execute the request and return an object that contains information
    // about the new stream.
    $streamsResponse = $youtube->liveStreams->insert('snippet,cdn',
        $streamInsert, array());

    // Bind the broadcast to the live stream.
    $bindBroadcastResponse = $youtube->liveBroadcasts->bind(
        $broadcastsResponse['id'],'id,contentDetails',
        array(
            'streamId' => $streamsResponse['id'],
        ));

    $htmlBody .= "<h3>Added Broadcast</h3><ul>";
    $htmlBody .= sprintf('<li>%s published at %s (%s)</li>',
        $broadcastsResponse['snippet']['title'],
        $broadcastsResponse['snippet']['publishedAt'],
        $broadcastsResponse['id']);
    $htmlBody .= '</ul>';

    $htmlBody .= "<h3>Added Stream</h3><ul>";
    $htmlBody .= sprintf('<li>%s (%s)</li>',
        $streamsResponse['snippet']['title'],
        $streamsResponse['id']);
    $htmlBody .= '</ul>';

    $htmlBody .= "<h3>Bound Broadcast</h3><ul>";
    $htmlBody .= sprintf('<li>Broadcast (%s) was bound to stream (%s).</li>',
        $bindBroadcastResponse['id'],
        $bindBroadcastResponse['contentDetails']['boundStreamId']);
    $htmlBody .= '</ul>';

  } catch (Google_Service_Exception $e) {
    $htmlBody = sprintf('<p>A service error occurred: <code>%s</code></p>',
        htmlspecialchars($e->getMessage()));
  } catch (Google_Exception $e) {
    $htmlBody = sprintf('<p>An client error occurred: <code>%s</code></p>',
        htmlspecialchars($e->getMessage()));
  }

  $_SESSION[$tokenSessionKey] = $client->getAccessToken();
} elseif ($OAUTH2_CLIENT_ID == 'REPLACE_ME') {
  $htmlBody = <<<END
  <h3>Client Credentials Required</h3>
  <p>
    You need to set <code>\$OAUTH2_CLIENT_ID</code> and
    <code>\$OAUTH2_CLIENT_ID</code> before proceeding.
  <p>
END;
} else {
  // If the user hasn't authorized the app, initiate the OAuth flow
  $state = mt_rand();
  $client->setState($state);
  $_SESSION['state'] = $state;

  $authUrl = $client->createAuthUrl();
  $htmlBody = <<<END
  <h3>Authorization Required</h3>
  <p>You need to <a href="$authUrl">authorize access</a> before proceeding.<p>
END;
}
?>

<!doctype html>
<html>
<head>
<title>Bound Live Broadcast</title>
</head>
<body>
  <?=$htmlBody?>
</body>
</html>
