<?php

function distance(string $strand_a, string $strand_b) : int
{
    if(strlen($strand_a) != strlen($strand_b))
    {
        throw new InvalidArgumentException('DNA strands must be of equal length.');
    }

    return count(
        array_diff_assoc(
            str_split($strand_a),
            str_split($strand_b)
    ));
}
