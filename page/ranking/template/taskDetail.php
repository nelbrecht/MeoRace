<?php
   include 'page/ranking/RankingCalculator.php';
   
   $dbFunction = new RacerTaskDbFunction();
   $racerTask = $dbFunction->findRacerTaskById( $_GET['id'] );
   
   $dbFunction->close();
   
   $taskComplete = true;
   $time = $racerTask->taskTime;
   if($racerTask->taskTime == null) {
      $taskComplete = false;
      $time = $racerTask->maxDuration - $racerTask->currentTime;
   }
?>

<div class="content_tab" id="actionconfirm_racertask">

<div class="top_content_wrapper">
   <div class="top_info_wrapper"> 
      <div class="left_info">
         <p class="manifest_number <?php $taskComplete ? print("manifest_completed") : print("manifest_possible"); ?>">
         <?php print( $racerTask->taskName ) ?></p>
      </div>
      <div class="middle_info">
         <p class="title"><?php print( $racerTask->taskDescription ) ?></p>
         <p class="description"><?php $taskComplete ? print("Completed") : print("Open"); ?></p>
      </div>
      <div class="right_info">
         <p class="manifest_points"><?php print( RankingCalculator::calculateScore( $racerTask, $raceFinished ) . "/" . $racerTask->price ) ?></p>
         <p class="manifest_maxduration"><?php print(Page::readableDuration( $time )) ?></p>
      </div>
   </div> <!-- top info wrapper -->
       </div>  <!-- top content wrapper -->
   

<div class="bottom_content_wrapper">
      

<p class="racer_checkpointlist_heading manifest_detail_heading">Full Manifest</p>

<?php
   $dbFunction = new DeliveryDbFunction();
   $deliveries = $dbFunction->findAll( $_GET['id']  );
   $dbFunction->close();
   
   for ( $i = 0; $i < count( $deliveries ) - 1; $i++ ) {
      foreach ( $deliveries[$i] as $delivery ) {
?>

<table>
  

  <tr onclick='<?php print( Page::getOnClickFunction( "ranking", "parcelDetail" ) ) ?>'>
<th rowspan="3" class="task_status task_completed"></th>
<th colspan="6" class="task_requirements no_requirements">Possible after: -</th>
</tr>

<tr onclick='<?php print( Page::getOnClickFunction( "ranking", "parcelDetail" ) ) ?>'>
<td rowspan="2" class="task_number">01</td>
<td class="checkpoint_name_first"><?php print( $delivery->pickupName ) ?></td>
<td class="goto_arrow">>></td>
<td class="parcel_name">P1</td>
<td class="goto_arrow">>></td>
<td class="checkpoint_name_second"><?php print( $delivery->dropoffName ) ?></td>
</tr>

<tr onclick='<?php print( Page::getOnClickFunction( "ranking", "parcelDetail" ) ) ?>'>
<td>14:30</td>
<td></td>
<td></td>
<td></td>
<td>14.45</td>
</tr>

</table>


      <?php
      }
   }
?>

<table>
  

  <tr onclick='<?php print( Page::getOnClickFunction( "ranking", "parcelDetail" ) ) ?>'>
<th rowspan="3" class="task_status task_completed"></th>
<th colspan="6" class="task_requirements no_requirements">Possible after: -</th>
</tr>

<tr onclick='<?php print( Page::getOnClickFunction( "ranking", "parcelDetail" ) ) ?>'>
<td rowspan="2" class="task_number">01</td>
<td class="checkpoint_name_first">Beda</td>
<td class="goto_arrow">>></td>
<td class="parcel_name">P1</td>
<td class="goto_arrow">>></td>
<td class="checkpoint_name_second">Amon</td>
</tr>

<tr onclick='<?php print( Page::getOnClickFunction( "ranking", "parcelDetail" ) ) ?>'>
<td>14:30</td>
<td></td>
<td></td>
<td></td>
<td>14.45</td>
</tr>

</table>

<table>
  

  <tr>
<th rowspan="3" class="task_status task_possible"></th>
<th colspan="6" class="task_requirements requirements">Possible after: 1</th>
</tr>

<tr>
<td rowspan="2" class="task_number">02</td>
<td class="checkpoint_name_first">Beda</td>
<td class="goto_arrow">>></td>
<td class="parcel_name">P1</td>
<td class="goto_arrow">>></td>
<td class="checkpoint_name_second">Amon</td>
</tr>

<tr>
<td>14:30</td>
<td></td>
<td></td>
<td></td>
<td>14.45</td>
</tr>

</table>


<table>
  

  <tr>
<th rowspan="3" class="task_status task_unreachable"></th>
<th colspan="6" class="task_requirements requirements">Possible after: 1, 2</th>
</tr>


<tr>
<td rowspan="2" class="task_number">03</td>
<td class="checkpoint_name_first">Beda</td>
<td class="goto_arrow">>></td>
<td class="parcel_name">P1</td>
<td class="goto_arrow">>></td>
<td class="checkpoint_name_second">Amon</td>
</tr>

<tr>
<td>14:30</td>
<td></td>
<td></td>
<td></td>
<td>14.45</td>
</tr>

</table>
  
 </div> <!-- bottom_content_wrapper xxx -->
</div> <!-- top content wrapper -->   