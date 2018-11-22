#!/usr/bin/php
<?php

    class GridHelper {
        private $b1 = 0;
        private $b2 = 0;
        private $b_as_string;
        private $force = 0;
        
        private $debug;
    
        private $d1 = 1;
        private $d2 = 1;
        
        private $saved_paths = array(); //successful paths
        private $visited = array("1,1"=>true); //visited points (in a path)
        private $path = ""; //StringBuffer of x,y paths 
        private $count = 0;
        /*$path = x,y x1,y1, x2,y2, 4,4 */
        
        private $fail = 0; //total failures since last success
        
        function __construct($x,$y,$force,$debug) {
            $this->b1 = $x;
            $this->b2 = $y;
            $this->force = $force;
            $this->b_as_string = join(",",array($x,$y));
            $this->debug = $debug;
        }
        
        public function __tostring() {
            return "GridHelper";
        }
    
        public function seek() {
            while ($this->fail < $this->force) { // 1500 for 4x4
                $this->reset();
                $this->path();
                $this->count += 1;
            }
            //foreach($this->saved_paths as $path) { print $path."\n"; }
            return count($this->saved_paths);
        }
        
        public function path() {
            $point = $this->getNextPoint();
            $point_as_string = join(",",$point);
            if ($point_as_string == "0,0") { 
                $this->fail += 1; 
                return; 
            }
            if ($point_as_string == $this->b_as_string) { 
                if (!isset($this->saved_paths[$this->path])) {
                    $this->saved_paths[$this->path] = $this->path;
                    if($this->debug){print $this->count.": ".$this->path."\n";}
                    
                    $this->fail = 0;
                }
                return; 
            }
            return $this->path();
        }
        
        public function reset() {
            $this->d1 = 1;
            $this->d2 = 1;
            $this->path = "";
            $this->visited = array("1,1"=>true);
        }
        
        
        private function getNextPoint() {
            $x = array();
            
            //Add in our choices
            if (($this->d1 != 1)&&
                (!isset($this->visited[join(",",array($this->d1 -1,$this->d2))]))) { 
                    array_push($x,array($this->d1 -1,$this->d2)); 
                }
            if (($this->d1 != $this->b1)
                &&(!isset($this->visited[join(",",array($this->d1 +1,$this->d2))]))) { 
                    array_push($x,array($this->d1 +1,$this->d2)); 
                }
            if (($this->d2 != 1)
                &&(!isset($this->visited[join(",",array($this->d1,$this->d2 -1))]))) { 
                    array_push($x,array($this->d1,$this->d2 -1)); 
                }
            if (($this->d2 != $this->b2)
                &&(!isset($this->visited[join(",",array($this->d1,$this->d2 +1))]))) { 
                    array_push($x,array($this->d1,$this->d2 +1)); 
                }

            $l = count($x);
            $new_point_array = array(0,0); //Default is no choice
            if ($l > 0) { //If the length of X is > 0, we have choices.             
                shuffle($x);
                $new_point_array = $x[array_rand($x,1)];
                $this->d1 = $new_point_array[0];
                $this->d2 = $new_point_array[1];
                $new_point_array_as_string = join(",",$new_point_array);
                $this->visited[$new_point_array_as_string] = true;
                $this->path .= $new_point_array_as_string." ";
            } 
            return $new_point_array;
        }
    
    }
    
    //GridHelper(x-count,y-count,#of failures to test through,show paths)
    $g = new GridHelper(4,4,1500,true);
    print $g->seek()."\n";

    exit;
?>