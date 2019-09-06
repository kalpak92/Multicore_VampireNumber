# Proj1

## Members
   1. **Kalpak Seal** - 8241-7219
   2. **Sagnik Ghosh** - 3343-6044

## No. of Worker actors created
The number of worker actors created : **50**

## Size of work unit of each work

**Test Scenario**

  `mix run proj1.exs 100000 200000`

| No. of Workers | Unit Size | CPU/Real Time (%age) |
|:--------------:|:---------:|:--------------------:|
|        1       |   100000  |         129          |
|        2       |   50000   |         203          |
|        5       |   20000   |         347          |
|       10       |   10000   |         377          |
|       20       |    5000   |         407          |
|       30       |    3333   |         392          |
|       40       |    2500   |         411          |
|       50       |    2000   |         418          |
|       60       |    1666   |         411          |
|       70       |    1428   |         418          |
|       80       |    1250   |         394          |
|       90       |    1111   |         389          |
|       100      |    1000   |         416          |
|       200      |    500    |         417          |

From the data collected, we determined that CPU/real-time percentage is linearly dependent on the no. of workers.
We inferred that increasing the no. of workers beyond a certain point yields no qualitative improvement on the performance for this set of input range.

Therefore, we have decided to keep the no. of workers to be `50` in our case, for this particular input.

**Scenario 2**

`mix run proj1.exs 1200 12600000`

| No. of Workers | Unit Size | CPU/Real Time (%age) |
|:--------------:|:---------:|:--------------------:|
|       10       |  1259880  |         214          |
|       20       |   629940  |         423          |
|       25       |   503952  |         518          |
|       35       |   359965  |         682          |
|       45       |   279973  |         728          |
|       60       |   209980  |         728          |
|       70       |   179982  |         714          |
|       100      |   125988  |         734          |
|       200      |   62994   |         726          |

As it can be seen, the CPU/real-time percentage is different and reaches close to 720%

## OUTPUT

```elixir
proj1 git:(master) ✗ time mix run proj1.exs 100000 200000
Compiling 1 file (.ex)
102510 201 510
163944 396 414
140350 350 401
105210 210 501
104260 260 401
129640 140 926
120600 201 600
153436 356 431
180225 225 801
115672 152 761
131242 311 422
126027 201 627
152685 261 585
145314 351 414
193257 327 591
136948 146 938
172822 221 782
133245 315 423
190260 210 906
182250 225 810
105750 150 705
134725 317 425
174370 371 470
182650 281 650
125248 152 824
108135 135 801
116725 161 725
156915 165 951
126846 261 486
146137 317 461
123354 231 534
186624 216 864
175329 231 759
173250 231 750
105264 204 516
162976 176 926
192150 210 915
125500 251 500
125433 231 543
197725 275 719
193945 395 491
146952 156 942
156289 269 581
135828 231 588
136525 215 635
152608 251 608
118440 141 840
129775 179 725
156240 240 651
135837 351 387
110758 158 701
125460 246 510 204 615
117067 167 701
132430 323 410
124483 281 443
150300 300 501
180297 201 897

mix run proj1.exs 100000 200000  2.65s user 0.15s system 418% cpu 0.667 total
```

![htop output](https://github.com/kalpak92/Multicore_VampireNumber/blob/master/Screen%20Shot%202019-09-06%20at%206.42.17%20PM.png "Performance snapshot")

## Largest problem you managed to solve

Executed range : **1200 to 126000000**

`mix run proj1.exs 1200 126000000  10113.02s user 105.55s system 722% cpu 23:33.90 total`

## How to run
1. Unzip the file in a directory and navigate to the directory.
2. Run cd on your terminal to navigate into project folder.
3. Run the mix command as follows to execute the project: 
    `mix run proj1.exs n1 n2` 
    
    Example : `mix run proj1.exs 100000 200000`
