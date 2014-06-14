<?php

   class Page {

      public static function printContent($moduleName, $page) {
         include( Configuration::MODULE_FOLDER . $moduleName . "/" . ucfirst( $moduleName )  . "DbFunction.php" );
            foreach ( $page->getDependencies()  as $dependency ) {
            include( Configuration::MODULE_FOLDER . $dependency . "DbFunction.php" );
         }
         include( Configuration::MODULE_FOLDER . $moduleName . "/template/" . $page->getPage() . ".php" );
      }

      public static function printFormStart( $moduleName, $pageName ) {
            print ( "<form method='post' action='commit.php' style='display:inline'>" );
            print ( "   <input name='module' value='$moduleName' type='hidden' />");
            print ( "   <input name='page' value='" . $pageName . "' type='hidden' />");
      }

      public static function printFormEnd( $buttonText = "save" ) {
            print ( "  <input type='submit' value='$buttonText' />" );
            print ( "</form>" );
      }



      public static function getLink($moduleName, $page) {
         
         $parameter = "module=$moduleName&page=" . $page->getPage();
         $link = "<a href='index.php?$parameter'>" . $page->getTitle() . "</a>";
         return $link;
      }

      public static function getParameter( $moduleName, $pageName = null, $id = null, $parameters = null ) {
         $parameter = "module=" . $moduleName;
         if ( $pageName != null ) {
            $parameter .= "&page=" . $pageName;
         }
         if ( $id = null ) {
            $parameter .= "&id=" . $id;
         }
         if ( $parameters != null ) {
            $parameter .= $parameters;
         }
         return $parameter;
      }

      public static function getListItem($title, $firstLine = "", $secondLine = "") {
         $result = " 
            <div class=listitem onclick='drilldown()'>
               <div class=li_head>$title</div>
               <div class=li_content>
                  <span class=li_firstline>$firstLine</span><br>
                  <span class=li_secondline>$secondLine</span>
               </div>
             </div>
         ";
         return $result;
      }

   }


?>


