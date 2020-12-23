<?php
// Configuration settings
$course = "COURSE_CODE";
$course_lower = "cs123";
$user = "YOUR_CSID_HERE";

$times = [
    '0' => null,
    '1' => [
        '1000' => ['John Doe', '10:00am', '11:00am'],
        '1100' => ['Jane Doe', '11:00am', '1:00pm'],
    ],
    '2' => [
        '1100' => ['Jane Doe', '11:00am', '12:30pm'],
        '1530' => ['John Doe', '3:30pm', '5:00pm'],
    ],
    '3' => [
        '1100' => ['Jane Doe', '11:00am', '12:30pm'],
        '1530' => ['John Doe', '3:30pm', '5:00pm'],
    ],
    '4' => [
        '1000' => ['John Doe', '10:00am', '11:00am'],
        '1100' => ['Jane Doe', '11:00am', '1:00pm'],
    ],
    '5' => [
        '1000' => ['John Doe', '10:00am', '11:00am'],
    ],
    '6' => null
];
?>
<!DOCTYPE html>
<html>
  <head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TITLE</title>
    <!-- CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,700" rel="stylesheet">
    <link href="../assets/css/v1.css" rel="stylesheet">
    <style>
      body {
        font-family: 'Open Sans', Arial, sans-serif;
        padding-top: 0px;
      }
      label {
        font-family: 'Open Sans', Arial, sans-serif;
      }
      .banner {
        font-family: 'Open Sans', Arial, sans-serif;
      }
      .topbanner {
        margin-bottom: 15px;
        z-index: 1;
      }
      .bodybanner {
        padding: 10px;
      }
      .utorange {
        background-color: #bf5700;
        color: #f5f5f5;
      }
      .bannercolor {
        background-color: #bf5700;
        color: #f5f5f5;
      }
    </style>
  </head>
  <body>
    <div class="banner topbanner bannercolor">
      <div class="container-fluid">
        <div class="row">
          <div class="col-xs-12">
            <h1 style="text-align: center;"><span style="font-size: 28px">HEADER</span></h1>
          </div>
        </div>
      </div>
    </div>

    <div class="container-fluid">
      <div class="form-group">
        <div class="row">
          <div class="col-md-3 col-xs-1">
            <!-- Nothing -->
          </div>
          <div class="col-md-6 col-xs-10">
            <h1>Office Hours</h1>
            <?php
            $date = date('Ymd');
            $timeslot_selected = $_REQUEST['timeslot'];
            $url = "https://www.cs.utexas.edu/~$user/$course_lower/signup_lists/" . $date . '-' . $timeslot_selected . ".txt";
            if (!empty($_REQUEST['view'])) {
              $fileloc = "/u/$user/public_html/$course_lower/signup_lists/" . $_REQUEST['view'] . '-' . $timeslot_selected . ".txt";
              $res = fopen($fileloc, "r");
              $contents = fread($res, filesize($fileloc));
              $contents_arr = explode("\n", $contents);
              ?>
              <h2>List for <?php echo date('l, F j, Y'); ?> at <?php echo $times[date('w')][$timeslot_selected][1]; ?></h2>
              <ol>
                <?php
                foreach ($contents_arr as $line) {
                  if ($line !== "") {
                    $name = substr($line, 7);
                    echo "<li>$name</li>";
                  }
                }
                ?>
              </ol>
              <a class="btn btn-primary" href="officehours">Haven't signed up yet? Click here to sign up!</a>
              <?php
            } elseif ($times[date('w')] === null) {
              ?>
              <p>No office hours today. Please come back on a day when we hold office hours.</p>
              <?php
            } elseif ($_POST['submitted'] === 'yes' && !empty($_POST['name'] && $_POST['name'] != '')) {
              $res = fopen("/u/$user/public_html/$course_lower/oh_lists/" . $date . '-' . $timeslot_selected . ".txt", 'a');
              fwrite($res, date('[H:i] ') . $_POST['name'] . "\n");
              ?>
              <p>You're in line!</p>
              <p><a class="btn btn-primary" href="officehours?view=<?php echo $date; ?>&timeslot=<?php echo $timeslot_selected; ?>">See the line</a></p>
              <p><b>Please read the below list of expectations and policies</b> before coming to office hours.</p>
              <?php
            } else {
            ?>
            <center>
            <div class="well">
                <h2>Sign up</h2>
                <p>for <b><?php echo date('l, F j, Y'); ?></b></p>
                <form method="post" action="officehours">
                    <div class="row">
                        <div class="col-xs-12 col-md-6">
                        <label for="name">Your name</label>
                        <input type="text" class="form-control" name="name" id="name" placeholder="First name and last initial" required>
                        </div>
                        <div class="col-xs-12 col-md-6">
                        <label for="timeslot">Timeslot</label>
                        <select name="timeslot" id="timeslot" class="form-control">
                            <?php
                            foreach ($times[date('w')] as $timeslot_id => $timeslot_info) {
                                echo "<option value=\"$timeslot_id\">$timeslot_info[1] - $timeslot_info[2] with $timeslot_info[0]</option>";
                            }
                            ?>
                        </select>
                        </div>
                    </div>
                <br />
                <input type="hidden" name="submitted" value="yes" />
                <button type="submit" class="btn btn-primary">Get in line</button>
                </form>
            </div>
            <br />
            <div class="well">
                <h2>View lines</h2>
                <form method="post" action="officehours">
                    <label for="timeslot">Timeslot</label>
                    <select name="timeslot" id="timeslot" class="form-control">
                        <?php
                        foreach ($times[date('w')] as $timeslot_id => $timeslot_info) {
                            echo "<option value=\"$timeslot_id\">$timeslot_info[1] - $timeslot_info[2] with $timeslot_info[0]</option>";
                        }
                        ?>
                    </select>
                    <br />
                    <input type="hidden" name="view" value="<?php echo $date; ?>" />
                    <button type="submit" class="btn btn-default">See line</button>
                </form>
            </div>
          </center>
            <?php
            }
            ?>
            <h2>How to use this system</h2>
            <p>On the day of office hours, sign up for a place in line. The instructor or TA will use this list to determine who to call first for office hours.</p>
            <p>You can also view the line for today to see how long it is and to see where you are.</p>
            <h2>How to get to office hours</h2>
            <p>All office hours can be accessed from the Zoom tab on our class's Canvas page.</p>
            <h2>Want to use this system for your class?</h2>
            <p>Are you a UT faculty member and want to use this office hours system for your class? Email <a href="mailto:wang@cs.utexas.edu">wang@cs.utexas.edu</a> for details. Two options exist:</p>
            <ol>
                <li>Hosted for you, free of charge. All I need are a list of your office hours times and the name of the instructor/TA that holds each of them.</li>
                <li>Get the PHP code for this system and install it yourself.</li>
            </ol>
            <br /><br /><br />
          </div>
          <div class="col-md-3 col-xs-1">
            <!-- Nothing -->
          </div>
        </div>
      </div>
    </div>
    <!-- JavaScript -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
  </body>
</html>