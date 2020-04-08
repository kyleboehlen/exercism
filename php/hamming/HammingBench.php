<?php

require_once 'hamming.php';
require_once 'hamming_student.php';

class HammingBench
{    
    const STRANDA = '';
    const STRANDB = '';

    /**
     * @Revs(1000000)
     * @Iterations(5)
     */
    public function benchStudentSolution()
    {
        dist(STRANDA, STRANDB);
    }

    /**
     * @Revs(1000000)
     * @Iterations(5)
     */
    public function benchMySolution()
    {
        distance(STRANDA, STRANDB);
    }
}