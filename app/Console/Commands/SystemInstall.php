<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;

class SystemInstall extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'app:install';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Command description';

    /**
     * Execute the console command.
     */
    public function handle()
    {
        try {
            $this->call('key:generate');
            $this->call('migrate');
            $this->call('config:cache');
            $this->call('event:cache');
            $this->call('route:cache');
            $this->call('view:cache');
            $this->call('storage:link');
            // $this->call('db:seed');

            $this->info('System installed successfully.');

        } catch (\Exception $e) {
            $this->error($e->getMessage());
        }

    }
}