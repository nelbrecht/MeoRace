<?php

   class RaceModule implements Module {

      private $pages;

      public function RaceModule() {
         $this->pages = array(
            new ModulePage("raceList", "Race List", array(Role::ADMIN), null, false, true ), 
            new ModulePage("taskList", "Configure Race", array(Role::RACE_MASTER), array(Role::RACE_MASTER), false, true, array("race/Task") ),
            new ModulePage("raceEdit", "Edit Race", array(Role::ADMIN, Role::RACE_MASTER), array(Role::ADMIN, Role::RACE_MASTER), true, false ),
            new ModulePage("taskEdit", "Edit Task", array(Role::RACE_MASTER), array(Role::RACE_MASTER), true, false, array("race/Task") ),
         );
      }

      public function getPages() {
         return $this->pages;
      }

   }


?>