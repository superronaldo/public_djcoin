<?php

namespace App\Console;

use Illuminate\Console\Scheduling\Schedule;
use Illuminate\Foundation\Console\Kernel as ConsoleKernel;

class Kernel extends ConsoleKernel
{
    /**
     * The Artisan commands provided by your application.
     *
     * @var array
     */
    protected $commands = [
        Commands\DeleteExpiredActivations::class,
        Commands\CreateFreeWallet::class,
        Commands\SendToFree::class,
        Commands\ReturnToMaster::class,
        Commands\CloseFreeWallet::class,
    ];

    /**
     * Define the application's command schedule.
     *
     * @param \Illuminate\Console\Scheduling\Schedule $schedule
     *
     * @return void
     */
    protected function schedule(Schedule $schedule)
    {
        $schedule->command('inspire')->hourly();
        $schedule->command('activations:clean')->daily();
        
        // $schedule->command('create:free')->daily();
        // $schedule->command('send:free')->daily();
        // $schedule->command('return:master')->daily();
        // $schedule->command('close:free')->daily();
    }

    /**
     * Register the Closure based commands for the application.
     *
     * @return void
     */
    protected function commands()
    {
        $this->load(__DIR__.'/Commands');

        require base_path('routes/console.php');
    }
}